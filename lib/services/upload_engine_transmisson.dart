import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flikcar_inspection/models/feature_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class EngineTransmissonService extends ChangeNotifier {
  FilePickerResult? result;
  String? fileName;
  bool isLoading = false;
  File? fileToDisplay;
  PlatformFile? pickedFile;
  String? thumbnailPath;
  String engineBayImage = "";
  String engineImage1 = "";
  String engineImage2 = "";
  String batteryImage = "";
  String engineOilDipstickImage = "";
  String engineThumbnail = "";
  String exhaustSmokeThumbnail = "";
  List<FeatureModel> commentsOnTransmission = [
    FeatureModel(
        name:
            "Car is in Working Condition but Towing Suggested to Avoid Damage to Clutch"),
    FeatureModel(
        name:
            "Car is in Working Condition but Towing Suggested to Avoid Damage to Gear"),
    FeatureModel(name: "Towing Required"),
    FeatureModel(name: "Gear box Oil Leakage"),
    FeatureModel(name: "Abnormal Noise coming from Gear Box"),
    FeatureModel(name: "Four Wheel Drive (4X4)"),
  ];
  List<FeatureModel> commentsOnEngine = [
    FeatureModel(name: "Not Converting to CNG/LPG"),
    FeatureModel(name: "RPM Not increasing"),
    FeatureModel(name: "Turbo Charger Noise"),
    FeatureModel(name: "Turbo Charger Not Working"),
    FeatureModel(name: "Fan Belt Noise"),
    FeatureModel(name: "Minor Noise"),
    FeatureModel(name: "Major Noise"),
  ];

  pickImage({
    required BuildContext context,
    required String type,
  }) async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());
        print(fileToDisplay!.path);
      }
    } catch (e) {
      print(e);
    }

    if (result != null) {
      selectImage(imageType: type, imagePath: pickedFile!.path!);

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
    if (result == null) {
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

  pickVideo({
    required BuildContext context,
    required String type,
  }) async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.video,
        allowMultiple: false,
      );

      if (result != null) {
        fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(pickedFile!.path.toString());
        print(fileToDisplay!.path);

        // Check the duration of the selected video
        final videoFile = File(pickedFile!.path.toString());
        final videoDuration = await getVideoDuration(videoFile);

        if (videoDuration <= const Duration(seconds: 31)) {
          thumbnailPath = await VideoThumbnail.thumbnailFile(
            video: videoFile.path,
            imageFormat: ImageFormat.JPEG,
            quality: 50,
          );
          selectImage(imageType: type, imagePath: thumbnailPath!);
          notifyListeners();

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 2),
                backgroundColor: Color(0xFF45C08D),
                content: Text("Video Selected"),
              ),
            );
          }
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

  selectImage({required String imageType, required String imagePath}) {
    switch (imageType) {
      case "engineBay":
        {
          engineBayImage = imagePath;
          notifyListeners();
        }
      case "engineImage1":
        {
          engineImage1 = imagePath;
          notifyListeners();
        }
      case "engineImage2":
        {
          engineImage2 = imagePath;
          notifyListeners();
        }
      case "batteryImage":
        {
          batteryImage = imagePath;
          notifyListeners();
        }
      case "engineOilDipstickImage":
        {
          engineOilDipstickImage = imagePath;
          notifyListeners();
        }
      case "engineThumbnail":
        {
          engineThumbnail = imagePath;
          notifyListeners();
        }
      case "exhaustSmokeThumbnail":
        {
          exhaustSmokeThumbnail = imagePath;
          notifyListeners();
        }
      default:
        {
          debugPrint("Invalid choice ");
        }
    }
  }

  uploadEngineAndTransmissionDetails() {
    Map<String, dynamic> engineAndTransmissionDetails = {
      "engine": "",
      "battery": "",
      "coolant": "",
      "engineOilDipstick": "",
      "engineOil": "",
      "engineMount": "",
      "engineBlow": "",
      "exhaustSmoke": "",
      "radiator": "",
      "videos": [
        {
          "path": "",
          "thumb": "",
          "type": "ENGINE",
        },
        {
          "path": "",
          "thumb": "",
          "type": "SILENCER",
        },
      ],
      "engineImages": [],
      "commentsOnEngine": [],
      "clutch": "",
      "gear": "",
      "steering": "",
      "brake": "",
      "suspension": "",
      "commentsOnTransmission": []
    };
  }
}
