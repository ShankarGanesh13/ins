import 'package:flutter/material.dart';

class VehicleInspectionService extends ChangeNotifier {
  int selectedIndex = 0;
  int vehicleId = DateTime.now().millisecondsSinceEpoch;

  increaseIndex() {
    if (selectedIndex < 6) {
      selectedIndex++;
    } else {
      selectedIndex = 0;
    }

    notifyListeners();
  }

  int getVehicleId() {
    debugPrint("vehicle ID-------------$vehicleId");
    return vehicleId;
  }
}
