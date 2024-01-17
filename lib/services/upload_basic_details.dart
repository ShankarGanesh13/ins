import 'dart:io';

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flikcar_inspection/models/feature_model.dart';
import 'package:flikcar_inspection/models/image_model.dart';
import 'package:flikcar_inspection/services/get_basic_details.dart';
import 'package:flikcar_inspection/services/upload_images.dart';
import 'package:flikcar_inspection/services/vehicle_inspection_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadBasicDetailsService extends ChangeNotifier {
  FilePickerResult? result;
  String? fileName;
  bool isLoading = false;
  File? fileToDisplay;
  PlatformFile? pickedFile;

  List<String> commentsOnBasic = [];
  List<String> comfort = [];
  List<String> safety = [];
  List<String> interior = [];
  List<String> exterior = [];
  List<String> entertainment = [];

  List<String> rcImages = [];

  List<String> chassisImages = [];

  List<String> hypothecationImages = [];

  List<String> roadTaxImages = [];
  List<String> insuranceImages = [];

  List<String> duplicateKeyImages = [];
  List<String> rtoNocImages = [];
  List<String> selectedComfort = [];
  List<String> selectedSafety = [];
  List<String> selectedInterior = [];
  List<String> selectedExterior = [];
  List<String> selectedEntertainment = [];
  List<String> selectedCommentOnBasicDetails = [];

  // String optionBasicDetailsImage1 = "";
  // String optionBasicDetailsImage2 = "";

  List<FeatureModel> interiorFeatures = [];
  List<FeatureModel> exteriorFeatures = [];
  List<FeatureModel> comfortFeatures = [];
  List<FeatureModel> safetyFeatures = [];
  List<FeatureModel> entertainmentFeatures = [];
  List<FeatureModel> commentsOnBasicDetails = [
    FeatureModel(name: "CNG/LPG Plate not Available", isSelected: false),
    FeatureModel(name: "CNG/LPG Removed", isSelected: false),
    FeatureModel(name: "Vin Plate Missing", isSelected: false),
    FeatureModel(
        name: "CNG/LPG Cylinder test certificate not Available",
        isSelected: false),
    FeatureModel(name: "RC Fitness Expired", isSelected: false),
    FeatureModel(
        name: "Car Converted from Commercial to private", isSelected: false),
    FeatureModel(name: "Migrated from Other State", isSelected: false),
    FeatureModel(name: "Remote Key Damaged / Not Available", isSelected: false),
    FeatureModel(name: "Chassis Number Rusted", isSelected: false),
  ];

  getFeatures() async {
    interiorFeatures = await GetBasicDetails.getinteriorFeatures();
    exteriorFeatures = await GetBasicDetails.getExteriorFeatures();
    safetyFeatures = await GetBasicDetails.getSafetyFeatures();
    entertainmentFeatures = await GetBasicDetails.getEntertainmentFeatures();
    comfortFeatures = await GetBasicDetails.getComfortFeatures();
    notifyListeners();
  }

  selectImageGallery(
      {required String imageType, required BuildContext context}) async {
    switch (imageType) {
      case "rc":
        {
          pickImageGallery(
              context: context,
              type: imageType,
              images: rcImages,
              multipleSelect: true);

          notifyListeners();
        }
        break;
      case "chassis":
        {
          pickImageGallery(
              context: context,
              type: imageType,
              images: chassisImages,
              multipleSelect: true);
          notifyListeners();
        }
        break;
      case "hypothecation":
        {
          pickImageGallery(
              context: context,
              type: imageType,
              images: hypothecationImages,
              multipleSelect: true);
          notifyListeners();
        }
        break;

      case "roadtax":
        {
          pickImageGallery(
              context: context,
              type: imageType,
              images: roadTaxImages,
              multipleSelect: true);
          notifyListeners();
        }
        break;
      case "duplicateKeyImage":
        {
          pickImageGallery(
              context: context,
              type: imageType,
              images: duplicateKeyImages,
              multipleSelect: true);
          notifyListeners();
        }
        break;

      case "insurance":
        {
          pickImageGallery(
              context: context,
              type: imageType,
              images: insuranceImages,
              multipleSelect: true);

          notifyListeners();
        }
        break;

      case "rtoNoc":
        {
          pickImageGallery(
              context: context,
              type: imageType,
              images: rtoNocImages,
              multipleSelect: true);
          notifyListeners();
        }
        break;

      default:
        {
          debugPrint("Invalid choice of basic details");
        }
    }
  }

  selectImageCamera(
      {required String imageType, required BuildContext context}) async {
    switch (imageType) {
      case "rc":
        {
          pickImageCamera(
            context: context,
            type: imageType,
            images: rcImages,
          );

          notifyListeners();
        }
        break;
      case "chassis":
        {
          // chassisImages = await UploadImagesService()
          //     .selectImageFromGallery(context: context);
          pickImageCamera(
            context: context,
            type: imageType,
            images: chassisImages,
          );
          notifyListeners();
        }
        break;
      case "hypothecation":
        {
          // hypothecationImages = await UploadImagesService()
          //     .selectImageFromGallery(context: context);
          pickImageCamera(
            context: context,
            type: imageType,
            images: hypothecationImages,
          );
          notifyListeners();
        }
        break;

      case "roadtax":
        {
          // roadTaxImages = await UploadImagesService()
          //     .selectImageFromGallery(context: context);
          pickImageCamera(
            context: context,
            type: imageType,
            images: roadTaxImages,
          );
          notifyListeners();
        }
        break;
      case "duplicateKeyImage":
        {
          // duplicateKeyImages = await UploadImagesService()
          //     .selectImageFromGallery(context: context);
          pickImageCamera(
            context: context,
            type: imageType,
            images: duplicateKeyImages,
          );
          notifyListeners();
        }
        break;

      case "insurance":
        {
          // insuranceImages = await UploadImagesService()
          //     .selectImageFromGallery(context: context);
          pickImageCamera(
            context: context,
            type: imageType,
            images: insuranceImages,
          );

          notifyListeners();
        }
        break;

      case "rtoNoc":
        {
          // rtoNocImages = await UploadImagesService()
          //     .selectImageFromGallery(context: context);
          pickImageCamera(
            context: context,
            type: imageType,
            images: rtoNocImages,
          );
          notifyListeners();
        }
        break;

      default:
        {
          debugPrint("Invalid choice of basic details");
        }
    }
  }

  removeImage(
      {required String imageType,
      required BuildContext context,
      required String image}) async {
    switch (imageType) {
      case "rc":
        {
          rcImages.remove(image);

          notifyListeners();
        }
        break;
      case "chassis":
        {
          chassisImages.remove(image);
          notifyListeners();
        }
        break;
      case "hypothecation":
        {
          hypothecationImages.remove(image);
          notifyListeners();
        }
        break;

      case "roadtax":
        {
          roadTaxImages.remove(image);
          notifyListeners();
        }
        break;
      case "duplicateKeyImage":
        {
          duplicateKeyImages.remove(image);
          notifyListeners();
        }
        break;

      case "insurance":
        {
          insuranceImages.remove(image);

          notifyListeners();
        }
        break;

      case "rtoNoc":
        {
          rtoNocImages.remove(image);
          notifyListeners();
        }
        break;

      default:
        {
          debugPrint("Invalid choice of basic details");
        }
    }
  }

  pickImageCamera(
      {required BuildContext context,
      required String type,
      required List<String> images}) async {
    List<File> displayFiles = [];
    try {
      // result = await FilePicker.platform.pickFiles(
      //   type: FileType.image,
      //   allowMultiple: multipleSelect,
      // );
      XFile? file = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 60);
      if (file != null) {
        displayFiles.add(File(file.path.toString()));

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 5),
              backgroundColor: Color(0xFF45C08D),
              content: Text("Image Uploading, Please wait"),
            ),
          );
        }
        images.addAll(
            await uploadImagesToFirestore(files: displayFiles, type: ""));

        notifyListeners();
      }
    } catch (e) {
      print(e);
    }

    if (images.isEmpty) {
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

  Future<List<String>> uploadImagesToFirestore(
      {required List<File> files, required String type}) async {
    final storage = FirebaseStorage.instance;
    List<String> imageUrls = [];

    for (var file in files) {
      try {
        // Compress the image before uploading
        List<int> compressedBytes = await FlutterImageCompress.compressWithList(
          file.readAsBytesSync(),
          minHeight: 800,
          minWidth: 600,
          quality: 65,
        );

        // Convert List<int> to Uint8List
        Uint8List compressedUint8List = Uint8List.fromList(compressedBytes);

        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference storageReference = storage.ref().child('$fileName.jpg');

        // Upload the compressed image
        UploadTask uploadTask = storageReference.putData(compressedUint8List);

        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        imageUrls.add(downloadUrl);

        print("***********$imageUrls");
      } catch (e) {
        print('Error uploading image: $e');
        // Handle errors if needed
      }
    }

    return imageUrls;
  }

  pickImageGallery(
      {required BuildContext context,
      required bool multipleSelect,
      required String type,
      required List<String> images}) async {
    List<XFile>? files = await ImagePicker().pickMultiImage(imageQuality: 60);
    List<File> displayFiles = [];
    try {
      // result = await FilePicker.platform.pickFiles(
      //   type: FileType.image,
      //   allowMultiple: multipleSelect,
      // );
      if (files.isNotEmpty) {
        files.forEach((element) {
          displayFiles.add(File(element.path.toString()));
        });
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 5),
              backgroundColor: Color(0xFF45C08D),
              content: Text("Image Uploading, Please wait"),
            ),
          );
        }
        images.addAll(
            await uploadImagesToFirestore(files: displayFiles, type: type));

        notifyListeners();
      }
    } catch (e) {
      print(e);
    }

    if (images.isEmpty) {
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

  void addFeatures({required String feature, required String id}) {
    switch (feature) {
      case "comfort":
        {
          if (selectedComfort.contains(id)) {
            selectedComfort.remove(id);
          } else {
            selectedComfort.add(id);
          }
        }
        break;
      case "safety":
        {
          if (selectedSafety.contains(id)) {
            selectedSafety.remove(id);
          } else {
            selectedSafety.add(id);
          }
        }
        break;
      case "interior":
        {
          if (selectedInterior.contains(id)) {
            selectedInterior.remove(id);
          } else {
            selectedInterior.add(id);
          }
        }
        break;
      case "exterior":
        {
          if (selectedExterior.contains(id)) {
            selectedExterior.remove(id);
          } else {
            selectedExterior.add(id);
          }
        }
        break;
      case "entertainment":
        {
          if (selectedEntertainment.contains(id)) {
            selectedEntertainment.remove(id);
          } else {
            selectedEntertainment.add(id);
          }
        }
        break;
      case "commentOnBasicDetails":
        {
          if (selectedCommentOnBasicDetails.contains(id)) {
            selectedCommentOnBasicDetails.remove(id);
          } else {
            selectedCommentOnBasicDetails.add(id);
          }
        }
        break;
      default:
        {
          print("------------------------------");
          print("Invalid choice");
        }
        break;
    }
  }

  String uploadBasicDocuments({
    required String inspectorName,
    required String carId,
    required int customerExpectedPrice,
    String? appointmentId,
    String? custContactNo,
    String? city,
    String? regType,
    String? regNo,
    String? rcAvailablilty,
    String? rcCondition,
    String? regDate,
    String? fittnessUpto,
    String? tobeScraped,
    String? regState,
    String? rtoLocation,
    String? ownerSerialNo,
    String? brand,
    String? model,
    String? variant,
    String? engineNo,
    String? chassisNo,
    String? regOwnerName,
    String? mfgMonth,
    int? manufacturingYear,
    String? fuelType,
    int? cc,
    String? hypoDetails,
    int? seat,
    String? missmatchRC,
    int? roadTaxValidity,
    String? roadTax,
    String? insurance,
    int? insuranceValidity,
    String? noClaimBonus,
    String? missmatchInsurance,
    String? duplicateKey,
    String? rtoNoc,
    int? rtoNocIssueDate,
    int? registrationYear,
    String? bodyType,
    String? transmission,
    String? ownerType,
    String? color,
    int? kmsDriven,
    String? carDescription,
    String? mileage,
    String? maxPower,
    String? maxTorque,
    String? inspectionReport,
    int? inspectionScore,
    String? noc,
    String? thumbnailImage,
  }) {
    Map<String, dynamic> basicDocuments = {
      "appointmentId": DateTime.now().millisecondsSinceEpoch,
      "custContactNo": custContactNo,

      "regType": regType,
      "regNo": regNo,
      "rcAvailablilty": rcAvailablilty,
      "rcAvailabilityImages": rcImages,
      "rcCondition": rcCondition,

      "fittnessUpto": fittnessUpto,
      "tobeScraped": tobeScraped,
      "regState": regState,

      "ownerSerialNo": ownerSerialNo,

      "engineNo": engineNo,
      "chassisNo": chassisNo,
      "chassisImages": chassisImages,
      "regOwnerName": regOwnerName,
      "mfgMonth": mfgMonth,

      "hypoDetails": hypoDetails,
      "hypoImages": hypothecationImages,

      "missmatchRC": missmatchRC,
      "roadTaxValidityImages": roadTaxImages,
      "roadTax": roadTax, //drop down
      "insurance": insurance,
      "insuranceImages": insuranceImages,
      "noClaimBonus": noClaimBonus,
      "missmatchInsurance": missmatchInsurance,
      "duplicateKey": duplicateKey,
      "duplicateKeyImages": duplicateKeyImages,
      "rtoNoc": rtoNoc,

      "rtoNocImages": rtoNocImages,
      "rtoNocIssueDate": rtoNocIssueDate,

      "commentsOnBasic": selectedCommentOnBasicDetails,
      //
      "imagePath": thumbnailImage,
      //
      "id": carId,
      "carPrice": customerExpectedPrice,
      "city": "Kolkata",
      "roadTaxValidity": roadTaxValidity,
      "insuranceValidity": insuranceValidity,
      "comfort": selectedComfort,
      "safety": selectedSafety,
      "interior": selectedInterior,
      "exterior": selectedExterior,
      "entertainment": selectedEntertainment,
      "brand": brand,
      "model": model,
      "variant": variant,
      "engineCC": cc,
      "manufacturingYear": manufacturingYear,
      "fuelType": fuelType,
      "registrationYear": registrationYear,
      "bodyType": bodyType,
      "transmission": transmission,
      "ownerType": ownerType,
      "color": color,
      "kmsDriven": kmsDriven,
      "carDescription": carDescription,
      "noc": noc, //yes|no
      "seat": seat,
      "mileage": mileage,
      "maxPower": maxPower,
      "maxTorque": maxTorque,
      "inspectionReport": inspectionReport,
      "inspectionScore": inspectionScore,
      "rtoLocation": rtoLocation,
    };
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference docRef = firestore
          .collection("auction_vehicles")
          .doc(carId)
          .collection("inspection")
          .doc("inspectionData");
      docRef.set({
        "basicDocuments": basicDocuments,
        "vehicleId": carId,
        "createdAt": DateTime.now().millisecondsSinceEpoch,
        "inspectorId": "2",
        "pdfUrl": null,
      });
      return "SUCCESS";
    } catch (e) {
      debugPrint("$e");
      return "ERROR";
    }
  }

  addAuctionData({
    String? bodyType,
    String? brand,
    String? city,
    String? color,
    String? fuelType,
    int? kmsDriven,
    String? model,
    String? ownerType,
    int? registrationYear,
    int? seat,
    String? transmission,
    String? variant,
    String? thumbnail,
    required String carId,
  }) {
    Map<String, dynamic> auctionData = {
      "carDetails": {
        "bodyType": bodyType,
        "brand": brand,
        "city": city,
        "color": color,
        "fuelType": fuelType,
        "id": carId,
        "imagePath": thumbnail,
        "kmsDriven": kmsDriven,
        "model": model,
        "ownerType": ownerType,
        "registrationYear": registrationYear,
        "seat": seat,
        "transmission": transmission,
        "variant": variant
      },
      "endTime": 1704431104243,
      "id": carId,
      "isSoldOut": false,
      "latestBid": null,
      "oneClickBuyPrice": null,
      "startPrice": 0,
      "startTime": 1686559681620,
    };
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference documentReference =
          firestore.collection("auctions").doc(carId);

      documentReference.set(auctionData);
      return "SUCCESS";
    } catch (e) {
      debugPrint("$e");
      return "ERROR";
    }
  }

  addAuctionVehicleData({
    int? carPrice,
    String? bodyType,
    String? brand,
    String? carDescription,
    String? city,
    String? color,
    //List<String>? comfort,
    int? engineCC,
    //List<String>? entertainment,
    //List<String>? exterior,
    String? fuelType,
    String? inspectionReport,
    int? inspectionScore,
    int? insuranceValidity,
    //List<String>? interior,
    int? kmsDriven,
    int? manufacturingYear,
    String? maxPower,
    String? maxTorque,
    String? mileage,
    String? model,
    String? noc,
    String? ownerType,
    int? registrationYear,
    int? roadTaxValidity,
    String? rtoLocation,
    // List<String>? safety,
    int? seat,
    String? transmission,
    String? variant,
    required String carId,
  }) {
    Map<String, dynamic> auctionVehicleData = {
      "carPrice": carPrice,
      "id": carId,
      "images": [],
      "pdfUrl": null,
      "properties": {
        "bodyType": bodyType,
        "brand": brand,
        "carDescription": carDescription,
        "city": city,
        "color": color,
        "comfort": selectedComfort,
        "engineCC": engineCC,
        "entertainment": selectedEntertainment,
        "exterior": selectedExterior,
        "fuelType": fuelType,
        "inspectionReport": inspectionReport,
        "inspectionScore": inspectionScore,
        "insuranceValidity": insuranceValidity,
        "interior": selectedInterior,
        "kmsDriven": kmsDriven,
        "manufacturingYear": manufacturingYear,
        "maxPower": maxPower,
        "maxTorque": maxTorque,
        "mileage": mileage,
        "model": model,
        "noc": true,
        "ownerType": ownerType,
        "registrationYear": registrationYear,
        "roadTaxValidity": roadTaxValidity,
        "rtoLocation": rtoLocation,
        "safety": selectedSafety,
        "seat": seat,
        "transmission": transmission,
        "variant": variant,
      },
      "status": "ACTIVE",
      "uploadedAt": DateTime.now().millisecondsSinceEpoch,
      "uploadedBy": "Inspection app",
      "videos": [],
    };
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference documentReference =
          firestore.collection("auction_vehicles").doc(carId);

      documentReference.set(auctionVehicleData);
      return "SUCCESS";
    } catch (e) {
      debugPrint("$e");
      return "ERROR";
    }
  }

  uploadData(
      {String? appointmentId,
      String? custContactNo,
      required String inspextorName,
      required int customerExpectedPrice,
      String? city,
      String? regType,
      String? regNo,
      String? rcAvailablilty,
      String? rcCondition,
      String? regDate,
      String? fittnessUpto,
      String? tobeScraped,
      String? regState,
      String? rtoLocation,
      String? ownerSerialNo,
      String? brand,
      String? model,
      String? variant,
      String? engineNo,
      String? chassisNo,
      String? regOwnerName,
      String? mfgMonth,
      int? manufacturingYear,
      String? fuelType,
      int? cc,
      String? hypoDetails,
      int? seat,
      String? missmatchRC,
      int? roadTaxValidity,
      String? roadTax,
      String? insurance,
      int? insuranceValidity,
      String? noClaimBonus,
      String? missmatchInsurance,
      String? duplicateKey,
      String? rtoNoc,
      int? rtoNocIssueDate,
      int? registrationYear,
      String? bodyType,
      String? transmission,
      String? ownerType,
      String? color,
      int? kmsDriven,
      String? carDescription,
      String? mileage,
      String? maxPower,
      String? maxTorque,
      String? inspectionReport,
      int? inspectionScore,
      String? noc,
      required String thumbnail,
      required String carId}) {
    uploadBasicDocuments(
      carId: carId,
      inspectorName: inspextorName,
      appointmentId: appointmentId,
      bodyType: bodyType,
      brand: brand,
      carDescription: carDescription,
      customerExpectedPrice: customerExpectedPrice,
      cc: cc,
      chassisNo: chassisNo,
      city: city,
      color: color,
      custContactNo: custContactNo,
      duplicateKey: duplicateKey,
      engineNo: engineNo,
      fittnessUpto: fittnessUpto,
      fuelType: fuelType,
      hypoDetails: hypoDetails,
      inspectionReport: inspectionReport,
      inspectionScore: inspectionScore,
      insurance: insurance,
      insuranceValidity: insuranceValidity,
      kmsDriven: kmsDriven,
      manufacturingYear: manufacturingYear,
      maxPower: maxPower,
      maxTorque: maxTorque,
      mfgMonth: mfgMonth,
      mileage: mileage,
      missmatchInsurance: missmatchInsurance,
      missmatchRC: missmatchRC,
      model: model,
      noClaimBonus: noClaimBonus,
      noc: noc,
      ownerSerialNo: ownerSerialNo,
      ownerType: ownerType,
      rcAvailablilty: rcAvailablilty,
      rcCondition: rcCondition,
      regDate: regDate,
      regNo: regNo,
      regOwnerName: regOwnerName,
      regState: regState,
      regType: regType,
      registrationYear: registrationYear,
      roadTax: roadTax,
      roadTaxValidity: roadTaxValidity,
      rtoLocation: rtoLocation,
      rtoNoc: rtoNoc,
      rtoNocIssueDate: rtoNocIssueDate,
      seat: seat,
      tobeScraped: tobeScraped,
      transmission: transmission,
      variant: variant,
      thumbnailImage: thumbnail,
    );
    addAuctionData(
      bodyType: bodyType,
      brand: brand,
      city: city,
      carId: carId,
      color: color,
      fuelType: fuelType,
      kmsDriven: kmsDriven,
      model: model,
      ownerType: ownerType,
      registrationYear: registrationYear,
      seat: seat,
      transmission: transmission,
      variant: variant,
      thumbnail: thumbnail,
    );
    addAuctionVehicleData(
      carId: carId,
      bodyType: bodyType,
      brand: brand,
      carDescription: carDescription,
      carPrice: customerExpectedPrice,
      city: city,
      color: color,
      engineCC: cc,
      fuelType: fuelType,
      inspectionReport: inspectionReport,
      inspectionScore: inspectionScore,
      insuranceValidity: insuranceValidity,
      kmsDriven: kmsDriven,
      manufacturingYear: manufacturingYear,
      maxPower: maxPower,
      maxTorque: maxTorque,
      mileage: mileage,
      model: model,
      noc: noc,
      ownerType: ownerType,
      registrationYear: registrationYear,
      roadTaxValidity: roadTaxValidity,
      rtoLocation: rtoLocation,
      seat: seat,
      transmission: transmission,
      variant: variant,
    );
  }

  clearImages() {
    commentsOnBasic = [];
    comfort = [];
    safety = [];
    interior = [];
    exterior = [];
    entertainment = [];
    rcImages = [];
    chassisImages = [];

    hypothecationImages = [];

    roadTaxImages = [];
    insuranceImages = [];

    duplicateKeyImages = [];
    rtoNocImages = [];
    selectedComfort = [];
    selectedSafety = [];
    selectedInterior = [];
    selectedExterior = [];
    selectedEntertainment = [];
    selectedCommentOnBasicDetails = [];
    notifyListeners();
  }
}
