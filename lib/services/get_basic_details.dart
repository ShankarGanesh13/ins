import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flikcar_inspection/models/body_type.dart';
import 'package:flikcar_inspection/models/brand_model.dart';
import 'package:flikcar_inspection/models/color_model.dart';
import 'package:flikcar_inspection/models/feature_model.dart';
import 'package:flikcar_inspection/models/fuel_type.dart';
import 'package:flikcar_inspection/models/ownership_type.dart';
import 'package:flikcar_inspection/models/rto_model.dart';
import 'package:flutter/material.dart';

class GetBasicDetails {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<List<FeatureModel>> getComfortFeatures() async {
    List<FeatureModel> comfortFeatures = [];
    try {
      DocumentReference collection =
          firestore.collection('car_features').doc("1");
      DocumentSnapshot documentSnapshot = await collection.get();
      var data = documentSnapshot.data() as Map<String, dynamic>;

      for (var label in data["labels"] as List) {
        comfortFeatures.add(FeatureModel.fromJson(label));
      }
    } catch (e) {
      print("-----------------$e");
    }
    return comfortFeatures;
  }

  static Future<List<FeatureModel>> getinteriorFeatures() async {
    List<FeatureModel> interiorFeatures = [];

    try {
      DocumentReference collection =
          firestore.collection('car_features').doc("3");
      DocumentSnapshot documentSnapshot = await collection.get();
      var data = documentSnapshot.data() as Map<String, dynamic>;

      for (var label in data["labels"] as List) {
        interiorFeatures.add(FeatureModel.fromJson(label));
      }
    } catch (e) {
      print("-----------------$e");
    }
    return interiorFeatures;
  }

  static Future<List<FeatureModel>> getExteriorFeatures() async {
    List<FeatureModel> exteriorFeatures = [];
    try {
      DocumentReference collection =
          firestore.collection('car_features').doc("4");
      DocumentSnapshot documentSnapshot = await collection.get();
      var data = documentSnapshot.data() as Map<String, dynamic>;

      for (var label in data["labels"] as List) {
        exteriorFeatures.add(FeatureModel.fromJson(label));
      }
    } catch (e) {
      print("-----------------$e");
    }
    return exteriorFeatures;
  }

  static Future<List<FeatureModel>> getSafetyFeatures() async {
    List<FeatureModel> safetyFeatures = [];
    try {
      DocumentReference collection =
          firestore.collection('car_features').doc("2");
      DocumentSnapshot documentSnapshot = await collection.get();
      var data = documentSnapshot.data() as Map<String, dynamic>;

      for (var label in data["labels"] as List) {
        safetyFeatures.add(FeatureModel.fromJson(label));
      }
    } catch (e) {
      print("-----------------$e");
    }
    return safetyFeatures;
  }

  static Future<List<FeatureModel>> getEntertainmentFeatures() async {
    List<FeatureModel> entertainmentFeatures = [];
    try {
      DocumentReference collection =
          firestore.collection('car_features').doc("5");
      DocumentSnapshot documentSnapshot = await collection.get();
      var data = documentSnapshot.data() as Map<String, dynamic>;

      for (var label in data["labels"] as List) {
        entertainmentFeatures.add(FeatureModel.fromJson(label));
      }
    } catch (e) {
      print("-----------------$e");
    }
    return entertainmentFeatures;
  }

  static Future<List<BrandModelVarient>> getBrandModelVarient() async {
    List<BrandModelVarient> brands = [];
    debugPrint("get brand model variant");
    try {
      CollectionReference collection =
          firestore.collection('brand_model_variants');
      QuerySnapshot querySnapshot = await collection.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        brands.add(BrandModelVarient.fromJson(
            documentSnapshot.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print("------------eeeee-----$e");
    }

    return brands;
  }

  static Future<List<BodyTypeModel>> getBodyType() async {
    List<BodyTypeModel> bodyType = [];

    try {
      CollectionReference collection = firestore.collection('bodyTypes');
      QuerySnapshot querySnapshot = await collection.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        bodyType.add(BodyTypeModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>));
      }
    } catch (e) {
      debugPrint("--------ggggg--------$e");
    }
    // debugPrint("$bodyType");
    return bodyType;
  }

  static Future<List<OwnerTypeModel>> getownership() async {
    List<OwnerTypeModel> ownership = [];
    try {
      CollectionReference collection = firestore.collection('ownerTypes');
      QuerySnapshot querySnapshot = await collection.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        ownership.add(OwnerTypeModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>));
      }
    } catch (e) {
      debugPrint("---------bbbb--------$e");
    }
    // debugPrint("$ownership");

    return ownership;
  }

  static Future<List<ColorModel>> getColors() async {
    List<ColorModel> colors = [];
    try {
      CollectionReference collection = firestore.collection('colors');
      QuerySnapshot querySnapshot = await collection.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        colors.add(ColorModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>));
      }
    } catch (e) {
      debugPrint("-----------qqqqq------$e");
    }
    //  debugPrint("$colors");

    return colors;
  }

  static Future<List<FuelTypeModel>> getFuelType() async {
    List<FuelTypeModel> fuelTypes = [];
    try {
      CollectionReference collection = firestore.collection('fuelTypes');
      QuerySnapshot querySnapshot = await collection.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        fuelTypes.add(FuelTypeModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print("-------------wwwww----$e");
    }
    // debugPrint("$fuelTypes");

    return fuelTypes;
  }

  static Future<List<Rto>> getRtoLocations() async {
    List<Rto> rto = [];
    try {
      CollectionReference collection = firestore.collection('rtoLocations');
      QuerySnapshot querySnapshot = await collection.get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        rto.add(Rto.fromJson(documentSnapshot.data() as Map<String, dynamic>));
      }
    } catch (e) {
      debugPrint("error om getting rto locations $e");
    }
    return rto;
  }
}
