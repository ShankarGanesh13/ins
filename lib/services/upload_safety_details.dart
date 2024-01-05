import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadSafetyDetailsService extends ChangeNotifier {
  FilePickerResult? result;
  String? fileName;
  bool isLoading = false;
  File? fileToDisplay;
  PlatformFile? pickedFile;
  String driverSideAirBagImage = "";
  String coDriverSideAirBagImage = "";
  String lhsAPillarImage = "";
  String lhsBPillarImage = "";
  String lhsCPillarImage = "";
  String rhsAPillarImage = "";
  String rhsBPillarImage = "";
  String rhsCPillarImage = "";
  String reverseParkingCameraImage = "";

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
      case "driverSideAirBagImage":
        {
          driverSideAirBagImage = imagePath;
          notifyListeners();
        }
      case "coDriverSideAirBagImage":
        {
          coDriverSideAirBagImage = imagePath;
          notifyListeners();
        }
      case "lhsAPillarImage":
        {
          lhsAPillarImage = imagePath;
          notifyListeners();
        }
      case "lhsBPillarImage":
        {
          lhsBPillarImage = imagePath;
          notifyListeners();
        }
      case "lhsCPillarImage":
        {
          lhsCPillarImage = imagePath;
          notifyListeners();
        }
      case "rhsAPillarImage":
        {
          rhsAPillarImage = imagePath;
          notifyListeners();
        }
      case "rhsBPillarImage":
        {
          rhsBPillarImage = imagePath;
          notifyListeners();
        }
      case "rhsCPillarImage":
        {
          rhsCPillarImage = imagePath;
          notifyListeners();
        }
      case "reverseParkingCameraImage":
        {
          reverseParkingCameraImage = imagePath;
          notifyListeners();
        }

      default:
        {
          debugPrint("Invalid choice ");
        }
    }
  }

  uploadSafetyDetails() {
    Map<String, dynamic> safetyDetails = {
      "abs": "",
      "noOfAirbags": 8,
      "driverSide": "",
      "coDriverSide": "",
      "lhsApillar": "",
      "lhsBpillar": "",
      "lhsCpillar": "",
      "rhsApillar": "",
      "rhsBpillar": "",
      "rhsCpillar": "",
      "reverseParkingCamera": "",
      "safetyImages": [],
    };
  }
}
