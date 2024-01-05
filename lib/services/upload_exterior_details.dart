import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flikcar_inspection/models/feature_model.dart';
import 'package:flutter/material.dart';

class UploadExteriorDetailsService extends ChangeNotifier {
  FilePickerResult? result;
  String? fileName;
  bool isLoading = false;
  File? fileToDisplay;
  PlatformFile? pickedFile;
  String frontMainImage = "";
  String frontBonnetOpenImage = "";
  String lhsFront45DegreeImage = "";
  String lhsSideViewImage = "";
  String rearMainImage = "";
  String rearBootImage = "";
  String rhsRear45DegreeImage = "";
  String rhsSideImage = "";
  String rhsRearDoorOpenImage = "";
  String rhsFrontDoorOpenImage = "";
  String dashBoardFromRearSeatImage = "";
  String bonnetImage = "";
  String upperCrossMemberImage = "";
  String lowerCrossMemberImage = "";
  String radiatorSupportImage = "";
  String headlightSupportImage = "";
  String lhsApronImage = "";
  String rhsApronImage = "";
  String frontWindshieldImage = "";
  String firewallImage = "";
  String cowlTopImage = "";
  String roofImage = "";
  String frontBumperImage = "";
  String lhsHeadlampImage = "";
  String rhsHeadLampImage = "";
  String lhsFoglampImage = "";
  String rhsFogLampImage = "";
  String lhsFenderImage = "";
  String lhsFrontAlloyImage = "";
  String lhsFrontTyreImage = "";
  String lhsOrvmImage = "";
  String lhsAPillarImage = "";
  String lhsFrontDoorImage = "";
  String lhsBPillarImage = "";
  String lhsRearDoorImage = "";
  String lhsCPillarImage = "";
  String lhsRunningBoardImage = "";
  String lhsRearAlloyImage = "";
  String lhsRearTyreImage = "";
  String lhsQuarterPanelImage = "";
  String rearBumperImage = "";
  String lhsTailLampImage = "";
  String rhsTailLampImage = "";
  String rearWindshieldImage = "";
  String bootDoorImage = "";
  String spareTyreImage = "";
  String bootFloorImage = "";
  String rhsQuarterPanelImage = "";
  String rhsRearAlloyImage = "";
  String rhsRearTyreImage = "";
  String rhsCPillarImage = "";
  String rhsRearDoorImage = "";
  String rhsBPillarImage = "";
  String rhsFrontDoorImage = "";
  String rhsAPillarImage = "";
  String rhsRunningBoardImage = "";
  String rhsFrontAlloyImage = "";
  String rhsFrontTyreImage = "";
  String rhsFenderImage = "";
  String rhsOrvmImage = "";
  String optionalImage1 = "";
  String optionalImage2 = "";
  List<FeatureModel> commentOnexterior = [
    FeatureModel(name: "Customized Vehicle or Body Modified"),
    FeatureModel(name: "Body Shell Replaced"),
    FeatureModel(name: "Roof Top Canvas"),
    FeatureModel(name: "Water Logged Vehicle"),
    FeatureModel(name: "Chassis Extension Repaired"),
    FeatureModel(name: "Strut Mounting Area Damaged"),
    FeatureModel(name: "Vehicle Color Changed"),
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

  void selectImage({required String imageType, required String imagePath}) {
    switch (imageType) {
      case "frontMainImage":
        frontMainImage = imagePath;
        break;
      case "frontBonnetOpenImage":
        frontBonnetOpenImage = imagePath;
        break;
      case "lhsFront45DegreeImage":
        lhsFront45DegreeImage = imagePath;
        break;
      case "lhsSideViewImage":
        lhsSideViewImage = imagePath;
        break;
      case "rearMainImage":
        rearMainImage = imagePath;
        break;
      case "rearBootImage":
        rearBootImage = imagePath;
        break;
      case "rhsRear45DegreeImage":
        rhsRear45DegreeImage = imagePath;
        break;
      case "rhsSideImage":
        rhsSideImage = imagePath;
        break;
      case "rhsRearDoorOpenImage":
        rhsRearDoorOpenImage = imagePath;
        break;
      case "rhsFrontDoorOpenImage":
        rhsFrontDoorOpenImage = imagePath;
        break;
      case "dashBoardFromRearSeatImage":
        dashBoardFromRearSeatImage = imagePath;
        break;
      case "bonnetImage":
        bonnetImage = imagePath;
        break;
      case "upperCrossMemberImage":
        upperCrossMemberImage = imagePath;
        break;
      case "lowerCrossMemberImage":
        lowerCrossMemberImage = imagePath;
        break;
      case "radiatorSupportImage":
        radiatorSupportImage = imagePath;
        break;
      case "headlightSupportImage":
        headlightSupportImage = imagePath;
        break;
      case "lhsApronImage":
        lhsApronImage = imagePath;
        break;
      case "rhsApronImage":
        rhsApronImage = imagePath;
        break;
      case "frontWindshieldImage":
        frontWindshieldImage = imagePath;
        break;
      case "firewallImage":
        firewallImage = imagePath;
        break;
      case "cowlTopImage":
        cowlTopImage = imagePath;
        break;
      case "roofImage":
        roofImage = imagePath;
        break;
      case "frontBumperImage":
        frontBumperImage = imagePath;
        break;
      case "lhsHeadlampImage":
        lhsHeadlampImage = imagePath;
        break;
      case "rhsHeadLampImage":
        rhsHeadLampImage = imagePath;
        break;
      case "lhsFoglampImage":
        lhsFoglampImage = imagePath;
        break;
      case "rhsFogLampImage":
        rhsFogLampImage = imagePath;
        break;
      case "lhsFenderImage":
        lhsFenderImage = imagePath;
        break;
      case "lhsFrontAlloyImage":
        lhsFrontAlloyImage = imagePath;
        break;
      case "lhsFrontTyreImage":
        lhsFrontTyreImage = imagePath;
        break;
      case "lhsOrvmImage":
        lhsOrvmImage = imagePath;
        break;
      case "lhsAPillarImage":
        lhsAPillarImage = imagePath;
        break;
      case "lhsFrontDoorImage":
        lhsFrontDoorImage = imagePath;
        break;
      case "lhsBPillarImage":
        lhsBPillarImage = imagePath;
        break;
      case "lhsRearDoorImage":
        lhsRearDoorImage = imagePath;
        break;
      case "lhsCPillarImage":
        lhsCPillarImage = imagePath;
        break;
      case "lhsRunningBoardImage":
        lhsRunningBoardImage = imagePath;
        break;
      case "lhsRearAlloyImage":
        lhsRearAlloyImage = imagePath;
        break;
      case "lhsRearTyreImage":
        lhsRearTyreImage = imagePath;
        break;
      case "lhsQuarterPanelImage":
        lhsQuarterPanelImage = imagePath;
        break;
      case "rearBumperImage":
        rearBumperImage = imagePath;
        break;
      case "lhsTailLampImage":
        lhsTailLampImage = imagePath;
        break;
      case "rhsTailLampImage":
        rhsTailLampImage = imagePath;
        break;
      case "rearWindshieldImage":
        rearWindshieldImage = imagePath;
        break;
      case "bootDoorImage":
        bootDoorImage = imagePath;
        break;
      case "spareTyreImage":
        spareTyreImage = imagePath;
        break;
      case "bootFloorImage":
        bootFloorImage = imagePath;
        break;
      case "rhsQuarterPanelImage":
        rhsQuarterPanelImage = imagePath;
        break;
      case "rhsRearAlloyImage":
        rhsRearAlloyImage = imagePath;
        break;
      case "rhsRearTyreImage":
        rhsRearTyreImage = imagePath;
        break;
      case "rhsCPillarImage":
        rhsCPillarImage = imagePath;
        break;
      case "rhsRearDoorImage":
        rhsRearDoorImage = imagePath;
        break;
      case "rhsBPillarImage":
        rhsBPillarImage = imagePath;
        break;
      case "rhsFrontDoorImage":
        rhsFrontDoorImage = imagePath;
        break;
      case "rhsAPillarImage":
        rhsAPillarImage = imagePath;
        break;
      case "rhsRunningBoardImage":
        rhsRunningBoardImage = imagePath;
        break;
      case "rhsFrontAlloyImage":
        rhsFrontAlloyImage = imagePath;
        break;
      case "rhsFrontTyreImage":
        rhsFrontTyreImage = imagePath;
        break;
      case "rhsFenderImage":
        rhsFenderImage = imagePath;
        break;
      case "rhsOrvmImage":
        rhsOrvmImage = imagePath;
        break;
      case "optionalImage1":
        optionalImage1 = imagePath;
        break;
      case "optionalImage2":
        optionalImage2 = imagePath;
        break;
      default:
        debugPrint("---------invalid choice------------");
        break;
    }
    notifyListeners();
  }

  uploadExteriorDetails() {
    Map<String, dynamic> exteriorDetails = {
      "bonnet": "",
      "upperCrossMember": "",
      "lowerCrossMember": "",
      "radiatorSupport": "",
      "headlightSupport": "",
      "lhsApron": "",
      "rhsApron": "",
      "frontWindshield": "",
      "firewall": "",
      "cowlTop": "",
      "roof": "",
      "frontBumper": "",
      "lhsHeadLamp": "",
      "rhsHeadLamp": "",
      "lhsFogLamp": "",
      "rhsFogLamp": "",
      "lhsFender": "",
      "lhsFrontAlloy": "",
      "lhsFrontTyre": "",
      "lhsOrvm": "",
      "lhsAPillar": "",
      "lhsFrontDoor": "",
      "lhsBPillar": "",
      "lhsRearDoor": "",
      "lhsCPillar": "",
      "lhsRunningBoard": "",
      "lhsRearAlloy": "",
      "lhsRearTyre": "",
      "lhsQuarterPanel": "",
      "rearBumper": "",
      "lhsTailLamp": "",
      "rhsTailLamp": "",
      "rearWindshield": "",
      "bootDoor": "",
      "spareTyre": "",
      "bootFloor": "",
      "rhsQuarterPanel": "",
      "rhsRearAlloy": "",
      "rhsRearTyre": "",
      "rhsCPillar": "",
      "rhsRearDoor": "",
      "rhsBPillar": "",
      "rhsFrontDoor": "",
      "rhsAPillar": "",
      "rhsRunningBoard": "",
      "rhsFrontAlloy": "",
      "rhsFrontTyre": "",
      "rhsOrvm": "",
      "rhsFender": "",
      "commentsOnExterior": [],
      "exteriorImages": [],
      "tyreImages": [],
      "dentImages": [] //optional
    };
  }
}
