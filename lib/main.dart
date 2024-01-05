import 'package:firebase_core/firebase_core.dart';
import 'package:flikcar_inspection/screens/login_screen/login_screen.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/basic_document_details.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/upload_vehicle_images/upload_vehicle_images.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/vehicle_inspection.dart';
import 'package:flikcar_inspection/services/upload_basic_details.dart';
import 'package:flikcar_inspection/services/upload_comfort_details.dart';
import 'package:flikcar_inspection/services/upload_electrical_interior.dart';
import 'package:flikcar_inspection/services/upload_engine_transmisson.dart';
import 'package:flikcar_inspection/services/upload_exterior_details.dart';
import 'package:flikcar_inspection/services/upload_images.dart';
import 'package:flikcar_inspection/services/upload_safety_details.dart';
import 'package:flikcar_inspection/services/vehicle_inspection_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UploadBasicDetailsService()),
      ChangeNotifierProvider(create: (context) => EngineTransmissonService()),
      ChangeNotifierProvider(
          create: (context) => UploadElectricalInteriorService()),
      ChangeNotifierProvider(create: (context) => UploadSafetyDetailsService()),
      ChangeNotifierProvider(
          create: (context) => UploadComfortDetailsService()),
      ChangeNotifierProvider(
          create: (context) => UploadExteriorDetailsService()),
      ChangeNotifierProvider(create: (context) => VehicleInspectionService()),
      ChangeNotifierProvider(create: (context) => UploadImagesService()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const VehicleInspection(),
    );
  }
}
