import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flikcar_inspection/models/feature_model.dart';
import 'package:flikcar_inspection/models/image_model.dart';
import 'package:flutter/material.dart';

class UploadExteriorDetailsService extends ChangeNotifier {
  List<FeatureModel> commentOnexterior = [
    FeatureModel(name: "Customized Vehicle or Body Modified"),
    FeatureModel(name: "Body Shell Replaced"),
    FeatureModel(name: "Roof Top Canvas"),
    FeatureModel(name: "Water Logged Vehicle"),
    FeatureModel(name: "Chassis Extension Repaired"),
    FeatureModel(name: "Strut Mounting Area Damaged"),
    FeatureModel(name: "Vehicle Color Changed"),
  ];

  List<String> selectedCommentOnExterior = [];

  addCommentsOnExterior({required String feature, required String type}) {
    if (selectedCommentOnExterior.contains(feature)) {
      selectedCommentOnExterior.remove(feature);
    } else {
      selectedCommentOnExterior.add(feature);
    }
  }

  uploadExteriorDetails({
    required String carId,
    String? bootDoor,
    String? bootFloor,
    String? bonnet,
    String? cowlTop,
    String? lhsApron,
    String? rhsApron,
    required List<ImageModel> dentImages, // optional
    required List<ImageModel> exteriorImages,
    String? firewall,
    String? frontBumper,
    String? frontWindshield,
    String? headlightSupport,
    String? lhsAPillar,
    String? lhsBPillar,
    String? lhsCPillar,
    String? lhsFender,
    String? lhsFrontAlloy,
    String? lhsFrontDoor,
    String? lhsFrontTyre,
    String? lhsFogLamp,
    String? lhsHeadLamp,
    String? lhsOrvm,
    String? lhsQuarterPanel,
    String? lhsRearAlloy,
    String? lhsRearDoor,
    String? lhsRearTyre,
    String? lhsRunningBoard,
    String? lowerCrossMember,
    String? radiatorSupport,
    String? rearBumper,
    String? rearWindshield,
    String? rhsAPillar,
    String? rhsBPillar,
    String? rhsCPillar,
    String? rhsFender,
    String? rhsFrontAlloy,
    String? rhsFrontDoor,
    String? rhsFrontTyre,
    String? rhsFogLamp,
    String? rhsHeadLamp,
    String? rhsOrvm,
    String? rhsQuarterPanel,
    String? rhsRearAlloy,
    String? rhsRearDoor,
    String? rhsRearTyre,
    String? rhsRunningBoard,
    String? roof,
    String? spareTyre,
    required List<ImageModel> tyreImages,
    String? upperCrossMember,
    String? lhsTailLamp,
    String? rhsTailLamp,
  }) {
    List<Map<String, String>> dentImageList = dentImages
        .map((image) => Map<String, String>.from(image.toJson()))
        .toList();
    List<Map<String, String>> tyreImageList = tyreImages
        .map((image) => Map<String, String>.from(image.toJson()))
        .toList();
    List<Map<String, String>> exteriorImageList = exteriorImages
        .map((image) => Map<String, String>.from(image.toJson()))
        .toList();
    Map<String, dynamic> exteriorDetails = {
      "bootDoor": bootDoor,
      "bootFloor": bootFloor,
      "bonnet": bonnet,
      "cowlTop": cowlTop,
      "commentsOnExterior": selectedCommentOnExterior,
      "dentImages": dentImageList,
      "exteriorImages": exteriorImageList,
      "firewall": firewall,
      "frontBumper": frontBumper,
      "frontWindshield": frontWindshield,
      "headlightSupport": headlightSupport,
      "lhsAPillar": lhsAPillar,
      "lhsBPillar": lhsBPillar,
      "lhsCPillar": lhsCPillar,
      "lhsFender": lhsFender,
      "lhsFrontAlloy": lhsFrontAlloy,
      "lhsFrontDoor": lhsFrontDoor,
      "lhsFrontTyre": lhsFrontTyre,
      "lhsFogLamp": lhsFogLamp,
      "lhsHeadLamp": lhsHeadLamp,
      "lhsOrvm": lhsOrvm,
      "lhsQuarterPanel": lhsQuarterPanel,
      "lhsRearAlloy": lhsRearAlloy,
      "lhsRearDoor": lhsRearDoor,
      "lhsRearTyre": lhsRearTyre,
      "lhsRunningBoard": lhsRunningBoard,
      "lowerCrossMember": lowerCrossMember,
      "radiatorSupport": radiatorSupport,
      "rearBumper": rearBumper,
      "rearWindshield": rearWindshield,
      "rhsAPillar": rhsAPillar,
      "rhsBPillar": rhsBPillar,
      "rhsCPillar": rhsCPillar,
      "rhsFender": rhsFender,
      "rhsFrontAlloy": rhsFrontAlloy,
      "rhsFrontDoor": rhsFrontDoor,
      "rhsFrontTyre": rhsFrontTyre,
      "rhsFogLamp": rhsFogLamp,
      "rhsHeadLamp": rhsHeadLamp,
      "rhsOrvm": rhsOrvm,
      "rhsQuarterPanel": rhsQuarterPanel,
      "rhsRearAlloy": rhsRearAlloy,
      "rhsRearDoor": rhsRearDoor,
      "rhsRearTyre": rhsRearTyre,
      "rhsRunningBoard": rhsRunningBoard,
      "roof": roof,
      "spareTyre": spareTyre,
      "tyreImages": tyreImageList,
      "upperCrossMember": upperCrossMember,
      "lhsTailLamp": lhsTailLamp,
      "rhsTailLamp": rhsTailLamp,
      "lhsApron": lhsApron,
      "rhsApron": rhsApron,
    };
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference docRef = firestore
          .collection("auction_vehicles")
          .doc(carId)
          .collection("inspection")
          .doc("inspectionData");
      docRef.update({
        "exteriorDetails": exteriorDetails,
      });
      return "SUCCESS";
    } catch (e) {
      debugPrint("$e");
      return "ERROR";
    }
  }
}
