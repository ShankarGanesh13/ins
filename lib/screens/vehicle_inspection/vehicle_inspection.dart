import 'package:flikcar_inspection/screens/vehicle_inspection/comfort_conveniance/comfort_conveniance.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/electrical_interior/electrical_interior.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/engine_transmission/engine_transmission.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/exterior_details/exterior_details.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/safety_details/safety_details.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/upload_vehicle_images/upload_vehicle_images.dart';
import 'package:flikcar_inspection/services/vehicle_inspection_service.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/app_bar.dart';
import 'package:flikcar_inspection/widgets/bottom_nav_bar.dart';
import 'package:flikcar_inspection/widgets/custom_dropdown.dart';
import 'package:flikcar_inspection/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'basic_document_details/basic_document_details.dart';

class VehicleInspection extends StatefulWidget {
  const VehicleInspection({super.key});
  static String vehicleId = DateTime.now().millisecondsSinceEpoch.toString();
  @override
  State<VehicleInspection> createState() => _VehicleInspectionState();
}

class _VehicleInspectionState extends State<VehicleInspection> {
  List<Widget> inspectionForm = [
    BasicDocumentDetails(
      vehicleId: VehicleInspection.vehicleId,
    ),
    UploadVehicleImages(
      vehicleId: VehicleInspection.vehicleId,
    ),
    EngineTransmission(
      vehicleId: VehicleInspection.vehicleId,
    ),
    ElectricalInterior(
      vehicleId: VehicleInspection.vehicleId,
    ),
    ExteriorDetails(
      vehicleId: VehicleInspection.vehicleId,
    ),
    SafetyDetails(
      vehicleId: VehicleInspection.vehicleId,
    ),
    ComfortConveniance(
      vehicleId: VehicleInspection.vehicleId,
    )
  ];
  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.watch<VehicleInspectionService>().selectedIndex;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAppbar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: inspectionForm.length,
            itemBuilder: (context, index) {
              return inspectionForm[selectedIndex];
            }),
      ),
    );
  }
}
