import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flikcar_inspection/models/feature_model.dart';
import 'package:flikcar_inspection/models/image_model.dart';
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
  List<String> selectedCommentOnInterior = [];
  List<String> selectedCommentsonElectrical = [];

  addCommentsOnEngineTransmission(
      {required String feature, required String type}) {
    if (type == "interior") {
      if (selectedCommentOnInterior.contains(feature)) {
        selectedCommentOnInterior.remove(feature);
      } else {
        selectedCommentOnInterior.add(feature);
      }
    } else if (type == "electrical") {
      if (selectedCommentsonElectrical.contains(feature)) {
        selectedCommentsonElectrical.remove(feature);
      } else {
        selectedCommentsonElectrical.add(feature);
      }
    }
  }

  uploadElectricalInteriorDetails({
    required String carId,
    String? fabricSeats,
    String? fuelLevel,
    required List<ImageModel> interiorImages,
    String? lhsFrontPowerWindow,
    String? lhsRearPowerWindow,
    String? leatherSeats,
    String? odometerReading,
    String? powerWindow,
    String? rearDefogger,
    String? rearWiper,
    String? rhsFrontPowerWindow,
    String? rhsRearPowerWindow,
    String? electricals,
  }) {
    List<Map<String, String>> imageList = interiorImages
        .map((image) => Map<String, String>.from(image.toJson()))
        .toList();
    Map<String, dynamic> electicalInteriorDetails = {
      "commentsOnElectrical": selectedCommentsonElectrical,
      "commentsOnInterior": selectedCommentOnInterior,
      "fabricSeats": fabricSeats,
      "fuelLevel": fuelLevel,
      "interiorImages": imageList,
      "lhsFrontPowerWindow": lhsFrontPowerWindow,
      "lhsRearPowerWindow": lhsRearPowerWindow,
      "leatherSeats": leatherSeats,
      "odometerReading": odometerReading,
      "powerWindow": powerWindow,
      "rearDefogger": rearDefogger,
      "rearWiper": rearWiper,
      "rhsFrontPowerWindow": rhsFrontPowerWindow,
      "rhsRearPowerWindow": rhsRearPowerWindow,
      "electricals": electricals,
    };

    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference docRef = firestore
          .collection("auction_vehicles")
          .doc(carId)
          .collection("inspection")
          .doc("inspectionData");
      docRef.update({
        "electicalInteriorDetails": electicalInteriorDetails,
      });
      return "SUCCESS";
    } catch (e) {
      debugPrint("$e");
      return "ERROR";
    }
  }
}
