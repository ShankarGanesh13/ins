import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadSafetyDetailsService extends ChangeNotifier {
  uploadSafetyDetails({
    required String carId,
    String? abs,
    String? noOfAirbags,
    String? driverSide,
    String? coDriverSide,
    String? lhsApillar,
    String? lhsBpillar,
    String? lhsCpillar,
    String? rhsApillar,
    String? rhsBpillar,
    String? rhsCpillar,
    String? reverseParkingCamera,
  }) {
    Map<String, dynamic> safetyDetails = {
      "abs": abs,
      "noOfAirbags": noOfAirbags,
      "driverSide": driverSide,
      "coDriverSide": coDriverSide,
      "lhsApillar": lhsApillar,
      "lhsBpillar": lhsBpillar,
      "lhsCpillar": lhsCpillar,
      "rhsApillar": rhsApillar,
      "rhsBpillar": rhsBpillar,
      "rhsCpillar": rhsCpillar,
      "reverseParkingCamera": reverseParkingCamera,
      "safetyImages": [],
    };
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference docRef = firestore
          .collection("auction_vehicles")
          .doc(carId)
          .collection("inspection")
          .doc("inspectionData");
      docRef.update({
        "safetyDetails": safetyDetails,
      });
      return "SUCCESS";
    } catch (e) {
      debugPrint("$e");
      return "ERROR";
    }
  }
}
