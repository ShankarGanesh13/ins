import 'package:flikcar_inspection/models/image_model.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/features_checkbox.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/exterior_details/widget/comment_on_exterior.dart';
import 'package:flikcar_inspection/services/upload_exterior_details.dart';
import 'package:flikcar_inspection/services/upload_images.dart';
import 'package:flikcar_inspection/services/vehicle_inspection_service.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/custom_dropdown.dart';
import 'package:flikcar_inspection/widgets/primary_button.dart';
import 'package:flikcar_inspection/widgets/upload1_image.dart';
import 'package:flikcar_inspection/widgets/upload_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExteriorDetails extends StatelessWidget {
  final String vehicleId;
  ExteriorDetails({super.key, required this.vehicleId});

  static List<String> exterior = [
    "Okay",
    "Repaired",
    "Replaced",
    "Dented",
    "Damaged",
    "Repainted",
    "Rusted",
    "Faded",
    "Scratched",
    "Not Opening",
    "Not Working",
    "Missing",
    "Not Applicable",
  ];

  static List<String> tyre = [
    "Chinese Tyre",
    "Resoaled",
    "Damaged",
    "Tyre Life (10-25mm)",
    "Tyre Life (26-50mm)",
    "Tyre Life (51-75mm)",
    "Tyre Life (76-100mm)",
  ];
  String? bootDoor;
  String? bootFloor;
  String? bonnet;
  String? cowlTop;

  String? firewall;
  String? frontBumper;
  String? frontWindshield;
  String? headlightSupport;
  String? lhsAPillar;
  String? lhsBPillar;
  String? lhsCPillar;
  String? lhsFender;
  String? lhsApron;
  String? rhsApron;
  String? lhsFrontAlloy;
  String? lhsFrontDoor;
  String? lhsFrontTyre;
  String? lhsFogLamp;
  String? lhsHeadLamp;
  String? lhsOrvm;
  String? lhsQuarterPanel;
  String? lhsRearAlloy;
  String? lhsRearDoor;
  String? lhsRearTyre;
  String? lhsRunningBoard;
  String? lowerCrossMember;
  String? radiatorSupport;
  String? rearBumper;
  String? rearWindshield;
  String? rhsAPillar;
  String? rhsBPillar;
  String? rhsCPillar;
  String? rhsFender;
  String? rhsFrontAlloy;
  String? rhsFrontDoor;
  String? rhsFrontTyre;
  String? rhsFogLamp;
  String? rhsHeadLamp;
  String? rhsOrvm;
  String? rhsQuarterPanel;
  String? rhsRearAlloy;
  String? rhsRearDoor;
  String? rhsRearTyre;
  String? rhsRunningBoard;
  String? roof;
  String? spareTyre;

  String? upperCrossMember;
  String? lhsTailLamp;
  String? rhsTailLamp;
  @override
  Widget build(BuildContext context) {
    List<ImageModel> exteriorImages =
        context.watch<UploadImagesService>().exteriorImages;
    List<ImageModel> dentImages =
        context.watch<UploadImagesService>().dentsImages;
    List<ImageModel> tyreImages =
        context.watch<UploadImagesService>().tyreImages;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Exterior Details",
              style: AppFonts.w700black20,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomDropDown(
                title: "Bonnet ",
                onChanged: (value) {
                  bonnet = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "Upper Cross Member ",
                onChanged: (value) {
                  upperCrossMember = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
              title: "Lower Cross Member ",
              onChanged: (value) {
                lowerCrossMember = value;
              },
              dropdownItems: exterior,
            ),
            CustomDropDown(
                title: "Radiator Support ",
                onChanged: (value) {
                  radiatorSupport = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "Headlight Support ",
                onChanged: (value) {
                  headlightSupport = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Apron ",
                onChanged: (value) {
                  lhsApron = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Apron ",
                onChanged: (value) {
                  rhsApron = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "Front Windshield ",
                onChanged: (value) {
                  frontWindshield = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "Firewall ",
                onChanged: (value) {
                  firewall = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "Cowl Top ",
                onChanged: (value) {
                  cowlTop = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "Roof ",
                onChanged: (value) {
                  roof = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "Front Bumper ",
                onChanged: (value) {
                  frontBumper = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Headlamp ",
                onChanged: (value) {
                  lhsHeadLamp = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Headlamp ",
                onChanged: (value) {
                  rhsHeadLamp = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Foglamp ",
                onChanged: (value) {
                  lhsFogLamp = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Foglamp ",
                onChanged: (value) {
                  rhsFogLamp = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Fender ",
                onChanged: (value) {
                  lhsFender = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Front Alloy ",
                onChanged: (value) {
                  lhsFrontAlloy = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Front Tyre ",
                onChanged: (value) {
                  lhsFrontTyre = value;
                },
                dropdownItems: tyre),
            CustomDropDown(
                title: "LHS ORVM ",
                onChanged: (value) {
                  lhsOrvm = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS A Pillar ",
                onChanged: (value) {
                  lhsAPillar = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Front Door ",
                onChanged: (value) {
                  lhsFrontDoor = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS B Pillar ",
                onChanged: (value) {
                  lhsBPillar = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Rear Door ",
                onChanged: (value) {
                  lhsRearDoor = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS C Pillar ",
                onChanged: (value) {
                  lhsCPillar = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Running Board ",
                onChanged: (value) {
                  lhsRunningBoard = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Rear Alloy ",
                onChanged: (value) {
                  lhsRearAlloy = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Rear Tyre  ",
                onChanged: (value) {
                  lhsRearTyre = value;
                },
                dropdownItems: tyre),
            CustomDropDown(
                title: "LHS Quarter Panel ",
                onChanged: (value) {
                  lhsQuarterPanel = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "Rear Bumper ",
                onChanged: (value) {
                  rearBumper = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Tail lamp ",
                onChanged: (value) {
                  lhsTailLamp = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Tail lamp ",
                onChanged: (value) {
                  rhsTailLamp = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "Rear Windshield ",
                onChanged: (value) {
                  rearWindshield = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "Boot Door ",
                onChanged: (value) {
                  bootDoor = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "Spare Tyre ",
                onChanged: (value) {
                  spareTyre = value;
                },
                dropdownItems: tyre),
            CustomDropDown(
                title: "Boot Floor ",
                onChanged: (value) {
                  bootFloor = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Quarter Panel ",
                onChanged: (value) {
                  rhsQuarterPanel = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Rear Alloy ",
                onChanged: (value) {
                  rhsRearAlloy = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Rear Tyre ",
                onChanged: (value) {
                  rhsRearTyre = value;
                },
                dropdownItems: tyre),
            CustomDropDown(
                title: "RHS C Pillar ",
                onChanged: (value) {
                  rhsCPillar = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Rear Door ",
                onChanged: (value) {
                  rhsRearDoor = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS B Pillar ",
                onChanged: (value) {
                  rhsBPillar = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Front Door ",
                onChanged: (value) {
                  rhsFrontDoor = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS A Pillar ",
                onChanged: (value) {
                  rhsAPillar = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Running Board ",
                onChanged: (value) {
                  rhsRunningBoard = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Front Alloy ",
                onChanged: (value) {
                  rhsFrontAlloy = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Front Tyre ",
                onChanged: (value) {
                  rhsFrontTyre = value;
                },
                dropdownItems: tyre),
            CustomDropDown(
                title: "RHS Fender ",
                onChanged: (value) {
                  rhsFender = value;
                },
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS ORVM ",
                onChanged: (value) {
                  rhsOrvm = value;
                },
                dropdownItems: exterior),
            Text(
              "Comments on Exterior",
              style: AppFonts.w700black16,
            ),
            const SizedBox(
              height: 20,
            ),
            CommentOnExterior(
                features: context
                    .watch<UploadExteriorDetailsService>()
                    .commentOnexterior,
                feature: ""),
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
                Provider.of<UploadExteriorDetailsService>(context,
                        listen: false)
                    .uploadExteriorDetails(
                  carId: vehicleId,
                  bonnet: bonnet,
                  bootDoor: bootDoor,
                  bootFloor: bootFloor,
                  cowlTop: cowlTop,
                  dentImages: dentImages,
                  exteriorImages: exteriorImages,
                  firewall: firewall,
                  frontBumper: frontBumper,
                  frontWindshield: frontWindshield,
                  headlightSupport: headlightSupport,
                  lhsAPillar: lhsAPillar,
                  lhsBPillar: lhsBPillar,
                  lhsCPillar: lhsCPillar,
                  lhsFender: lhsFender,
                  lhsFogLamp: lhsFogLamp,
                  lhsFrontAlloy: lhsFrontAlloy,
                  lhsFrontDoor: lhsFrontDoor,
                  lhsFrontTyre: lhsFrontTyre,
                  lhsHeadLamp: lhsHeadLamp,
                  lhsOrvm: lhsOrvm,
                  lhsQuarterPanel: lhsQuarterPanel,
                  lhsRearAlloy: lhsRearAlloy,
                  lhsRearDoor: lhsRearDoor,
                  lhsRearTyre: lhsRearTyre,
                  lhsRunningBoard: lhsRunningBoard,
                  lhsTailLamp: lhsTailLamp,
                  lowerCrossMember: lowerCrossMember,
                  radiatorSupport: radiatorSupport,
                  rearBumper: rearBumper,
                  rearWindshield: rearWindshield,
                  rhsAPillar: rhsAPillar,
                  rhsBPillar: rhsBPillar,
                  rhsCPillar: rhsCPillar,
                  rhsFender: rhsFender,
                  rhsFogLamp: rhsFogLamp,
                  rhsFrontAlloy: rhsFrontAlloy,
                  rhsFrontDoor: rhsFrontDoor,
                  rhsFrontTyre: rhsFrontTyre,
                  rhsHeadLamp: rhsHeadLamp,
                  rhsOrvm: rhsOrvm,
                  rhsQuarterPanel: rhsQuarterPanel,
                  rhsRearAlloy: rhsRearAlloy,
                  rhsRearDoor: rhsRearDoor,
                  rhsRearTyre: rhsRearTyre,
                  rhsRunningBoard: rhsRunningBoard,
                  rhsTailLamp: rhsTailLamp,
                  roof: roof,
                  spareTyre: spareTyre,
                  tyreImages: tyreImages,
                  upperCrossMember: upperCrossMember,
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
