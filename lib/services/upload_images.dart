import 'dart:io';

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flikcar_inspection/services/vehicle_inspection_service.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flikcar_inspection/models/image_model.dart';
import 'package:flikcar_inspection/screens/image_editor_screen/image_editor_screen.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class UploadImagesService extends ChangeNotifier {
  FirebaseStorage storage = FirebaseStorage.instance;

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

  carImagesCamera({
    required BuildContext context,
    required String type,
  }) {
    if (type == "interior") {
      pickImageCamera(
        type: "INT",
        context: context,
        images: interiorImages,
      );
    } else if (type == "exterior") {
      pickImageCamera(
        type: "EXT",
        context: context,
        images: exteriorImages,
      );
    } else if (type == "dents") {
      pickImageCamera(
        type: "DENT",
        context: context,
        images: dentsImages,
      );
    } else if (type == "tyre") {
      pickImageCamera(
        type: "TYRE",
        context: context,
        images: tyreImages,
      );
    } else if (type == "engine") {
      pickImageCamera(
        type: "ENGINE",
        context: context,
        images: engineImages,
      );
    } else if (type == "thumbnail") {
      pickImageCamera(
        type: "THUMB",
        context: context,
        images: thumbnailImages,
      );
    } else if (type == "others") {
      pickImageCamera(
        type: "OTHER",
        context: context,
        images: otherImages,
      );
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
    List<XFile>? files = await ImagePicker().pickMultiImage(imageQuality: 60);
    List<File> displayFiles = [];
    try {
      // result = await FilePicker.platform.pickFiles(
      //   type: FileType.image,
      //   allowMultiple: multipleSelect,
      // );
      if (files.isNotEmpty) {
        files.forEach((element) {
          displayFiles.add(File(element.path.toString()));
        });
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 5),
              backgroundColor: Color(0xFF45C08D),
              content: Text("Image Uploading, Please wait"),
            ),
          );
        }
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

  pickImageCamera(
      {required BuildContext context,
      required String type,
      required List<ImageModel> images}) async {
    List<File> displayFiles = [];
    try {
      // result = await FilePicker.platform.pickFiles(
      //   type: FileType.image,
      //   allowMultiple: multipleSelect,
      // );
      XFile? file = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 60);
      if (file != null) {
        displayFiles.add(File(file.path.toString()));

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 5),
              backgroundColor: Color(0xFF45C08D),
              content: Text("Image Uploading, Please wait"),
            ),
          );
        }
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
    if (type == "tyre") {
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
    allImages = [];
    allImages.addAll(thumbnailImages);
    allImages.addAll(exteriorImages);
    allImages.addAll(interiorImages);
    allImages.addAll(dentsImages);
    allImages.addAll(otherImages);
    allImages.addAll(tyreImages);
    allImages.addAll(engineImages);
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
  String? engineVideoUrl;
  String? exhaustVideoUrl;

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

        // Check the duration of the selected video
        final videoFile = File(pickedVideoFile!.path.toString());
        final videoDuration = await getVideoDuration(videoFile);

        if (videoDuration <= const Duration(seconds: 31)) {
          debugPrint("video selected");
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 10),
                backgroundColor: const Color(0xFF45C08D),
                content: const Text("Video Uploading, Please wait"),
                action: SnackBarAction(label: "Dismiss", onPressed: () {}),
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
            debugPrint("====================$videoUrl");

            if (type == "engine") {
              engineVideoUrl = videoUrl;
            }
            if (type == "exhaust") {
              exhaustVideoUrl = videoUrl;
            }
            notifyListeners();
          });
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 2),
                backgroundColor: Colors.red,
                content: Text(
                  "Selected video is too long (max 30 seconds)",
                ),
              ),
            );
          }
        }
      }
    } catch (e) {
      print(e);
    }

    if (videoResult == null) {
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

  uploadAuctionCarImages(
      {required String carId, required BuildContext context}) {
    mergeAllImages();
    //allImages = [];
    List<Map<String, String>> imageList = allImages
        .map((image) => Map<String, String>.from(image.toJson()))
        .toList();
    Map<String, dynamic> images = {
      "images": imageList,
      "videos": [
        {
          "path": engineVideoUrl,
          "thumb":
              "https://firebasestorage.googleapis.com/v0/b/flikcar-bac6e.appspot.com/o/001.jpg?alt=media&token=58caa43d-3141-4969-a8ed-d10c51ea8cac",
          "type": "ENGINE",
        },
        {
          "path": exhaustVideoUrl,
          "thumb":
              "https://firebasestorage.googleapis.com/v0/b/flikcar-bac6e.appspot.com/o/002.jpg?alt=media&token=d47b010c-7b7f-4b9b-ab25-e99e1c31db53",
          "type": "SILENCER",
        }
      ],
    };
    allImages.addAll(tyreImages);
    if (interiorImages.isNotEmpty &&
        exteriorImages.isNotEmpty &&
        thumbnailImages.isNotEmpty &&
        engineImages.isNotEmpty &&
        tyreImages.isNotEmpty) {
      try {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        DocumentReference documentReference =
            firestore.collection("auction_vehicles").doc(carId);
        documentReference.update(images);
        Provider.of<VehicleInspectionService>(context, listen: false)
            .increaseIndex();
      } catch (e) {
        debugPrint("error uploading images---------$e");
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Color(0xFF45C08D),
          content: Text("Upload all required images"),
        ),
      );
    }
  }

  clearAllImages() {
    interiorImages = [];
    //
    exteriorImages = [];
    //
    engineImages = [];
    //
    tyreImages = [];
    //
    dentsImages = [];
    //
    thumbnailImages = [];
    //
    otherImages = [];
    allImages = [];
    thumbnailImagePath = "";
    notifyListeners();
  }
}
