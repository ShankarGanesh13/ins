import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flikcar_inspection/models/feature_model.dart';
import 'package:flutter/material.dart';

class UploadElectricalInteriorService extends ChangeNotifier {
  FilePickerResult? result;
  String? fileName;
  bool isLoading = false;
  File? fileToDisplay;
  PlatformFile? pickedFile;
  String consoleImage = "";
  String odometerImage = "";
  String leatherSeatImage1 = "";
  String leatherSeatImage2 = "";
  String fabricSeatImage1 = "";
  String fabricSeatImage2 = "";
  List<FeatureModel> commentsOnInterior = [
    FeatureModel(name: "Door Trim Torn"),
    FeatureModel(name: "AC Vent Damaged"),
    FeatureModel(name: "AC Knob Damaged / Not Working"),
    FeatureModel(name: "Cabin Floor Rusted"),
    FeatureModel(name: "Roof Lining Loose / Replaced"),
    FeatureModel(name: "Roof lining Damaged"),
    FeatureModel(name: "Gear Box Cover Damaged"),
    FeatureModel(name: "Dashboard Broken"),
    FeatureModel(name: "Dashboard Scratched"),
    FeatureModel(name: "Electrical Seat Adjusment Not Working"),
    FeatureModel(name: "Driver Seat Broken or Sliding Not Working"),
  ];
  List<FeatureModel> commentsOnElectrical = [
    FeatureModel(name: "Odometer Tampered"),
    FeatureModel(name: "Navigation Chip Not Available"),
    FeatureModel(name: "Base Tube / Woofer Retained By the Customer"),
    FeatureModel(name: "Music system Retained By the Customer"),
    FeatureModel(name: "Amplifier Retained By the Customer"),
    FeatureModel(name: "Horn Not Working"),
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
      case "consoleImage":
        {
          consoleImage = imagePath;
          notifyListeners();
        }
      case "odometerImage":
        {
          odometerImage = imagePath;
          notifyListeners();
        }
      case "leatherSeatImage1":
        {
          leatherSeatImage1 = imagePath;
          notifyListeners();
        }
      case "leatherSeatImage2":
        {
          leatherSeatImage2 = imagePath;
          notifyListeners();
        }
      case "fabricSeatImage1":
        {
          fabricSeatImage1 = imagePath;
          notifyListeners();
        }
      case "fabricSeatImage2":
        {
          fabricSeatImage2 = imagePath;
          notifyListeners();
        }

      default:
        {
          debugPrint("Invalid choice ");
        }
    }
  }

  uploadElectricalInteriorDetails() {
    Map<String, dynamic> electicalInteriorDetails = {
      "odometerReading": "",
      "fuelLevel": "",
      "electricals": "",
      "rearWiper": "",
      "rearDefogger": "",
      "powerWindow": "",
      "rhsFrontPowerWindow": "",
      "lhsFrontPowerWindow": "",
      "lhsRearPowerWindow": "",
      "rhsRearPowerWindow": "",
      "leatherSeats": "",
      "fabricSeats": "",
      "commentsOnElectrical": "",
      "commentsOnInterior": "",
      "interiorImages": [], // type: INT
    };
  }
}
