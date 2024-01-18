import 'package:flikcar_inspection/models/image_model.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/features_checkbox.dart';
import 'package:flikcar_inspection/services/upload_engine_transmisson.dart';
import 'package:flikcar_inspection/services/upload_images.dart';
import 'package:flikcar_inspection/services/vehicle_inspection_service.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/comments_checkbox.dart';
import 'package:flikcar_inspection/widgets/custom_dropdown.dart';
import 'package:flikcar_inspection/widgets/primary_button.dart';
import 'package:flikcar_inspection/widgets/upload1_image.dart';
import 'package:flikcar_inspection/widgets/upload_images.dart';
import 'package:flikcar_inspection/widgets/upload_video.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EngineTransmission extends StatelessWidget {
  final String vehicleId;
  const EngineTransmission({super.key, required this.vehicleId});

  static String? engineCondition;
  static String? batteryCondition;
  static String? coolant;
  static String? engineDipStick;
  static String? engineOil;
  static String? engineMount;
  static String? engineBlow;
  static String? exhaustSmoke;
  static String? radiator;
  static String? engineNoise;
  static String? clutch;
  static String? gear;
  static String? brake;
  static String? steering;
  static String? suspension;
  static String? commentsOnTransmisson;

  @override
  Widget build(BuildContext context) {
    List<ImageModel> engineImages =
        context.watch<UploadImagesService>().engineImages;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Engine & Transmission",
              style: AppFonts.w700black20,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomDropDown(
                title: "Engine Condition ",
                onChanged: (value) {
                  EngineTransmission.engineCondition = value;
                },
                dropdownItems: const [
                  "Okay",
                  "Repaired",
                  "MIL Light Glowing",
                  "RPM Fluctuating",
                  "Over Heating",
                  "Fuel Leakage from injector",
                  "Air filter Box Damaged",
                  "Seized"
                ]),

            CustomDropDown(
                title: "Battery Condition ",
                onChanged: (value) {
                  EngineTransmission.batteryCondition = value;
                },
                dropdownItems: const [
                  "Okay",
                  "Changed",
                  "Weak",
                  "Dead",
                  "Acid Leakage",
                  "Damaged"
                ]),
            CustomDropDown(
                title: "Coolant ",
                onChanged: (value) {
                  EngineTransmission.coolant = value;
                },
                dropdownItems: const ["Okay", "Leaking", "Dirty", "Level Low"]),
            CustomDropDown(
                title: "Engine Oil Dipstick ",
                onChanged: (value) {
                  EngineTransmission.engineDipStick = value;
                },
                dropdownItems: const ["Okay", "Broken", "Not Available"]),
            CustomDropDown(
                title: "Engine Oil ",
                onChanged: (value) {
                  EngineTransmission.engineOil = value;
                },
                dropdownItems: const ["Okay", "Leaking", "Dirty", "Level Low"]),
            CustomDropDown(
                title: "Engine Mount ",
                onChanged: (value) {
                  EngineTransmission.engineMount = value;
                },
                dropdownItems: const [
                  "Okay",
                  "Broken",
                  "Loose",
                  "Excess Vibration",
                  "Rusted"
                ]),
            CustomDropDown(
                title: "Engine Blow By Status ",
                onChanged: (value) {
                  EngineTransmission.engineBlow = value;
                },
                dropdownItems: const [
                  "No Blow By",
                  "Permisable Blow By",
                  "Oil Spilage on Idle",
                  "Back Compression"
                ]),
            CustomDropDown(
                title: "Exhaust Smoke ",
                onChanged: (value) {
                  EngineTransmission.exhaustSmoke = value;
                },
                dropdownItems: const ["Okay", "Black", "Blue", "White"]),

            CustomDropDown(
              title: "Radiator ",
              onChanged: (value) {
                EngineTransmission.radiator = value;
              },
              dropdownItems: const [
                "Okay",
                "Fan Motor Noise",
                "Fan Not Working",
                "Radiator Damaged"
              ],
            ),
            //
            //
            //

            //
            //
            //

            CustomDropDown(
                title: "Clutch ",
                onChanged: (value) {
                  EngineTransmission.clutch = value;
                },
                dropdownItems: const [
                  "Okay",
                  "Hard",
                  "Spongy",
                  "Bearing Noise"
                ]),
            CustomDropDown(
                title: "Gear ",
                onChanged: (value) {
                  EngineTransmission.gear = value;
                },
                dropdownItems: const [
                  "Okay",
                  "Hard",
                  "Not Engaging",
                  "Abnormal Noise",
                  "Gear Knob Broken/Damaged"
                ]),
            CustomDropDown(
                title: "Brake ",
                onChanged: (value) {
                  EngineTransmission.brake = value;
                },
                dropdownItems: const [
                  "Okay",
                  "Ineffective",
                  "Noise",
                  "Master Cylinder Leakage"
                ]),
            CustomDropDown(
                title: "Steering ",
                onChanged: (value) {
                  EngineTransmission.steering = value;
                },
                dropdownItems: const [
                  "Okay",
                  "Abnormal Noise",
                  "Hard",
                  "Pump Noise",
                  "Wheel Adjustment Not Working"
                ]),
            CustomDropDown(
                title: "Suspension ",
                onChanged: (value) {
                  EngineTransmission.suspension = value;
                },
                dropdownItems: const [
                  "Okay",
                  "Weak",
                  "Damaged",
                  "Leakage in suspension",
                  "Abnormal Noise",
                ]),
            Text(
              "Comments on Engine Details",
              style: AppFonts.w700black16,
            ),
            const SizedBox(
              height: 20,
            ),
            CommentsCheckbox(
              features:
                  context.watch<EngineTransmissonService>().commentsOnEngine,
              type: "engine",
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Comments on Transmission",
              style: AppFonts.w700black16,
            ),
            const SizedBox(
              height: 20,
            ),
            CommentsCheckbox(
              features: context
                  .watch<EngineTransmissonService>()
                  .commentsOnTransmission,
              type: "transmission",
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 8),
          child: PrimaryButton(
              title: "Next",
              function: () {
                Provider.of<EngineTransmissonService>(context, listen: false)
                    .uploadEngineAndTransmissionDetails(
                  carId: vehicleId,
                  battery: EngineTransmission.batteryCondition,
                  brake: EngineTransmission.brake,
                  clutch: EngineTransmission.clutch,
                  coolant: EngineTransmission.coolant,
                  engine: EngineTransmission.engineCondition,
                  engineBlow: EngineTransmission.engineBlow,
                  engineMount: EngineTransmission.engineMount,
                  engineOil: EngineTransmission.engineOil,
                  engineOilDipstick: EngineTransmission.engineDipStick,
                  exhaustSmoke: EngineTransmission.exhaustSmoke,
                  gear: EngineTransmission.gear,
                  radiator: EngineTransmission.radiator,
                  steering: EngineTransmission.steering,
                  suspension: EngineTransmission.suspension,
                  engineImages: engineImages,
                );
                Provider.of<VehicleInspectionService>(context, listen: false)
                    .increaseIndex();
              },
              borderColor: const Color(0xff161F31),
              backgroundColor: const Color(0xff161F31),
              textStyle: AppFonts.w500white14),
        ),
      ),
    );
  }
}
