import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flikcar_inspection/models/feature_model.dart';
import 'package:flikcar_inspection/models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class EngineTransmissonService extends ChangeNotifier {
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
  List<String> selectedTransmissionComments = [];
  List<String> selectedEngineComments = [];

  addCommentsOnEngineTransmission(
      {required String feature, required String type}) {
    if (type == "engine") {
      if (selectedEngineComments.contains(feature)) {
        selectedEngineComments.remove(feature);
      } else {
        selectedEngineComments.add(feature);
      }
    } else if (type == "transmission") {
      if (selectedTransmissionComments.contains(feature)) {
        selectedTransmissionComments.remove(feature);
      } else {
        selectedTransmissionComments.add(feature);
      }
    }
  }

  uploadEngineAndTransmissionDetails({
    required String carId,
    required List<ImageModel> engineImages,
    String? battery,
    String? brake,
    String? clutch,
    String? coolant,
    String? engine,
    String? engineBlow,
    String? engineMount,
    String? engineOil,
    String? engineOilDipstick,
    String? exhaustSmoke,
    String? gear,
    String? radiator,
    String? steering,
    String? suspension,
  }) {
    List<Map<String, String>> imageList = engineImages
        .map((image) => Map<String, String>.from(image.toJson()))
        .toList();
    Map<String, dynamic> engineAndTransmissionDetails = {
      "battery": battery,
      "brake": brake,
      "clutch": clutch,
      "commentsOnEngine": selectedEngineComments,
      "commentsOnTransmission": selectedTransmissionComments,
      "coolant": coolant,
      "engine": engine,
      "engineBlow": engineBlow,
      "engineImages": imageList,
      "engineMount": engineMount,
      "engineOil": engineOil,
      "engineOilDipstick": engineOilDipstick,
      "exhaustSmoke": exhaustSmoke,
      "gear": gear,
      "radiator": radiator,
      "steering": steering,
      "suspension": suspension,
    };
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference docRef = firestore
          .collection("auction_vehicles")
          .doc(carId)
          .collection("inspection")
          .doc("inspectionData");
      docRef.update({
        "engineAndTransmissionDetails": engineAndTransmissionDetails,
      });
      return "SUCCESS";
    } catch (e) {
      debugPrint("$e");
      return "ERROR";
    }
  }
}
