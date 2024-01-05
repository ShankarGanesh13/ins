import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flikcar_inspection/models/feature_model.dart';
import 'package:flutter/material.dart';

class UploadComfortDetailsService extends ChangeNotifier {
  FilePickerResult? result;
  String? fileName;
  bool isLoading = false;
  File? fileToDisplay;
  PlatformFile? pickedFile;
  String sunroofImage1 = "";
  String sunroofImage2 = "";
  String optionalComfortImage1 = "";
  String optionalComfortImage2 = "";
  List<FeatureModel> commentOnComfort = [
    FeatureModel(name: "Electrical Wiring Damaged"),
    FeatureModel(name: "Starter Motor / Solanoid Malfunction"),
    FeatureModel(name: "Battery Not Available"),
    FeatureModel(name: "Front Drive Axle Noise"),
    FeatureModel(name: "Car Pulling on One Side"),
    FeatureModel(name: "Noise from Silencer Assembly"),
    FeatureModel(name: "Hand Brake not Working"),
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

  selectImage({required String imageType, required String imagePath}) {
    switch (imageType) {
      case "sunroofImage1":
        {
          sunroofImage1 = imagePath;
          notifyListeners();
        }
      case "sunroofImage2":
        {
          sunroofImage2 = imagePath;
          notifyListeners();
        }
      case "optionalComfortImage1":
        {
          optionalComfortImage1 = imagePath;
          notifyListeners();
        }
      case "optionalComfortImage2":
        {
          optionalComfortImage2 = imagePath;
          notifyListeners();
        }

      default:
        {
          debugPrint("Invalid choice ");
        }
    }
  }

  uploadComfortDetails() {
    Map<String, dynamic> comfortDetails = {
      "manualAC": "",
      "climateControl": "",
      "musicSystem": "",
      "stereo": "",
      "inbuiltSpeaker": "",
      "externalSpeaker": "",
      "steeringMountedAudioControl": "",
      "sunroof": "",
      "commentsOnComfort": [],
      "comfortImages": [], //type:OTHER
    };
  }
}
