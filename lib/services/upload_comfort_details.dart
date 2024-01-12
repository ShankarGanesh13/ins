import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flikcar_inspection/models/feature_model.dart';
import 'package:flutter/material.dart';

class UploadComfortDetailsService extends ChangeNotifier {
  List<String> selectedComfortComments = [];
  List<FeatureModel> commentOnComfort = [
    FeatureModel(name: "Electrical Wiring Damaged"),
    FeatureModel(name: "Starter Motor / Solanoid Malfunction"),
    FeatureModel(name: "Battery Not Available"),
    FeatureModel(name: "Front Drive Axle Noise"),
    FeatureModel(name: "Car Pulling on One Side"),
    FeatureModel(name: "Noise from Silencer Assembly"),
    FeatureModel(name: "Hand Brake not Working"),
  ];

  addComfortComments({required String feature}) {
    if (selectedComfortComments.contains(feature)) {
      selectedComfortComments.remove(feature);
    } else {
      selectedComfortComments.add(feature);
    }
  }

  uploadComfortDetails({
    required String carId,
    String? manualAC,
    String? climateControl,
    String? musicSystem,
    String? stereo,
    String? inbuiltSpeaker,
    String? externalSpeaker,
    String? steeringMountedAudioControl,
    String? sunroof,
  }) {
    Map<String, dynamic> comfortDetails = {
      "manualAC": manualAC,
      "climateControl": climateControl,
      "musicSystem": musicSystem,
      "stereo": stereo,
      "inbuiltSpeaker": inbuiltSpeaker,
      "externalSpeaker": externalSpeaker,
      "steeringMountedAudioControl": steeringMountedAudioControl,
      "sunroof": sunroof,
      "commentsOnComfort": selectedComfortComments,
      "comfortImages": [],
    };
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference docRef = firestore
          .collection("auction_vehicles")
          .doc(carId)
          .collection("inspection")
          .doc("inspectionData");
      docRef.update({
        "comfortDetails": comfortDetails,
      });
      return "SUCCESS";
    } catch (e) {
      debugPrint("$e");
      return "ERROR";
    }
  }
}
