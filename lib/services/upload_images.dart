import 'dart:io';

import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flikcar_inspection/models/image_model.dart';
import 'package:flikcar_inspection/screens/image_editor_screen/image_editor_screen.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadImagesService extends ChangeNotifier {
  FirebaseStorage storage = FirebaseStorage.instance;
  Future<String> selectImageFromCamera({required BuildContext context}) async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 70);
    if (file != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ImageEditorScreen(image: File(file.path))));
      return file.path;
    } else {
      return '';
    }
  }

  Future<List<String>> selectImageFromGallery(
      {required BuildContext context}) async {
    List<String> imageUrls = [];

    List<XFile>? files = await ImagePicker().pickMultiImage(imageQuality: 60);

    if (files == null || files.isEmpty) {
      debugPrint("No Image Selected");
      // No images selected
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
          context: context, message: "No Images Selected", duration: 2));
      return imageUrls;
    }
    if (files.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
          context: context, message: "Uploading", duration: 5));
      for (XFile file in files) {
        String imageName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference storageReference = storage.ref().child('images/$imageName');
        UploadTask uploadTask = storageReference.putFile(File(file.path));

        await uploadTask.whenComplete(() async {
          String imageUrl = await storageReference.getDownloadURL();
          imageUrls.add(imageUrl);
        });
      }
    }
    debugPrint("$imageUrls");
    return imageUrls;
  }

  FilePickerResult? result;

  bool isLoading = false;
  PlatformFile? pickedFile;
  List<File> fileToDisplay = [];
  List<String> carImages = [];
  //

  List<ImageModel> interiorImages = [];
  //

  List<ImageModel> exteriorImages = [];
  //

  List<ImageModel> engineImages = [];
  //

  List<ImageModel> tyreImages = [];
  //

  List<ImageModel> dentsImages = [];
  //

  List<ImageModel> thumbnailImages = [];
  //

  List<ImageModel> otherImages = [];
  List<ImageModel> allImages = [];
  String thumbnailImagePath = "";

  pickCarImages({
    required BuildContext context,
    required String type,
  }) {
    if (type == "interior") {
      pickImage(
          type: "INT",
          context: context,
          multipleSelect: true,
          images: interiorImages);
    } else if (type == "exterior") {
      pickImage(
          type: "EXT",
          context: context,
          multipleSelect: true,
          images: exteriorImages);
    } else if (type == "dents") {
      pickImage(
          type: "DENT",
          context: context,
          multipleSelect: true,
          images: dentsImages);
    } else if (type == "tyre") {
      pickImage(
        type: "TYRE",
        context: context,
        images: tyreImages,
        multipleSelect: true,
      );
    } else if (type == "engine") {
      pickImage(
          type: "ENGINE",
          context: context,
          multipleSelect: true,
          images: engineImages);
    } else if (type == "thumbnail") {
      pickImage(
          type: "THUMB",
          context: context,
          multipleSelect: false,
          images: thumbnailImages);
    } else if (type == "others") {
      pickImage(
          type: "OTHER",
          context: context,
          multipleSelect: true,
          images: otherImages);
    } else {
      print("+++++++++++++++");
      print("invalid type");

      print("+++++++++++++");
    }
  }

  ////////////////////
  pickImage(
      {required BuildContext context,
      required bool multipleSelect,
      required String type,
      required List<ImageModel> images}) async {
    List<File> displayFiles = [];
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: multipleSelect,
      );
      if (result != null) {
        result!.files.forEach((element) {
          displayFiles.add(File(element.path.toString()));
        });

        images.addAll(
            await uploadImagesToFirestore(files: displayFiles, type: type));

        if (type == "THUMB" && images.isNotEmpty) {
          thumbnailImagePath = images[0].path;
        }

        notifyListeners();
      }
    } catch (e) {
      print(e);
    }

    if (images.isNotEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Color(0xFF45C08D),
            content: Text("Image Selected"),
          ),
        );
      }
    }
    if (images.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Color(0xFF45C08D),
            content: Text(
              "No image selected",
            ),
          ),
        );
      }
    }
  }

  Future<List<ImageModel>> uploadImagesToFirestore(
      {required List<File> files, required String type}) async {
    final storage = FirebaseStorage.instance;
    List<ImageModel> imageUrls = [];

    for (var file in files) {
      try {
        // Compress the image before uploading
        List<int> compressedBytes = await FlutterImageCompress.compressWithList(
          file.readAsBytesSync(),
          minHeight: 800,
          minWidth: 600,
          quality: 65,
        );

        // Convert List<int> to Uint8List
        Uint8List compressedUint8List = Uint8List.fromList(compressedBytes);

        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference storageReference = storage.ref().child('$fileName.jpg');

        // Upload the compressed image
        UploadTask uploadTask = storageReference.putData(compressedUint8List);

        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        imageUrls.add(ImageModel(type: type, path: downloadUrl));

        print("***********$imageUrls");
      } catch (e) {
        print('Error uploading image: $e');
        // Handle errors if needed
      }
    }

    return imageUrls;
  }

  ////////////////////////////
  removeImage(
      {required ImageModel image,
      required BuildContext context,
      required String type}) {
    if (type == "interior") {
      interiorImages.remove(image);
    }
    if (type == "exterior") {
      exteriorImages.remove(image);
    }
    if (type == "dents") {
      dentsImages.remove(image);
    }
    if (type == "tyres") {
      tyreImages.remove(image);
    }
    if (type == "engine") {
      engineImages.remove(image);
    }
    if (type == "thumbnail") {
      thumbnailImages.remove(image);
    }
    if (type == "others") {
      otherImages.remove(image);
    } else {
      print("+++++++++++++++");
      print("invalid type");

      print("+++++++++++++");
    }
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Color(0xFF45C08D),
          content: Text("Image removed"),
        ),
      );
    }
    notifyListeners();
  }

  mergeAllImages() {
    allImages.addAll(interiorImages);
    allImages.addAll(exteriorImages);
    allImages.addAll(thumbnailImages);
    allImages.addAll(dentsImages);
    allImages.addAll(otherImages);
    allImages.addAll(engineImages);
    allImages.addAll(tyreImages);
  }

//
//
//
//
//
  FilePickerResult? videoResult;
  PlatformFile? pickedVideoFile;
  String? videoFileName;
  File? videoFileToDisplay;

  pickVideo({
    required BuildContext context,
    required String type,
  }) async {
    try {
      videoResult = await FilePicker.platform.pickFiles(
        type: FileType.video,
        allowMultiple: false,
      );

      if (videoResult != null) {
        videoFileName = videoResult!.files.first.name;
        pickedVideoFile = videoResult!.files.first;
        videoFileToDisplay = File(pickedVideoFile!.path.toString());
        print(videoFileToDisplay!.path);

        // Check the duration of the selected video
        final videoFile = File(pickedVideoFile!.path.toString());
        final videoDuration = await getVideoDuration(videoFile);

        if (videoDuration <= const Duration(seconds: 21)) {
          print("video selected");
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 6),
                backgroundColor: Color(0xFF45C08D),
                content: Text("Video Uploading"),
              ),
            );
          }
          final String fileName = pickedVideoFile!.path!.split('/').last;
          final Reference storageReference =
              FirebaseStorage.instance.ref().child('videos/$fileName');

          final UploadTask uploadTask =
              storageReference.putFile(videoFileToDisplay!);
          await uploadTask.whenComplete(() async {
            String videoUrl = await storageReference.getDownloadURL();
            print(videoUrl);
          });
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 2),
                backgroundColor: Colors.red,
                content: Text(
                  "Selected video is too long (max 20 seconds)",
                ),
              ),
            );
          }
        }
      }
    } catch (e) {
      print(e);
    }

    if (result == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Color(0xFF45C08D),
            content: Text(
              "No video selected",
            ),
          ),
        );
      }
    }
  }

  Future<Duration> getVideoDuration(File videoFile) async {
    final videoPlayerController = VideoPlayerController.file(videoFile);
    await videoPlayerController.initialize();
    final duration = videoPlayerController.value.duration;
    await videoPlayerController.dispose();
    return duration;
  }

  selectThumbnail({required BuildContext context}) {
    pickImage(
        type: "THUMB",
        context: context,
        multipleSelect: false,
        images: thumbnailImages);

    thumbnailImagePath = thumbnailImages[0].path;
    notifyListeners();
  }
}
