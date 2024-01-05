import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/features_checkbox.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/exterior_details/widget/comment_on_exterior.dart';
import 'package:flikcar_inspection/services/upload_exterior_details.dart';
import 'package:flikcar_inspection/services/vehicle_inspection_service.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/custom_dropdown.dart';
import 'package:flikcar_inspection/widgets/primary_button.dart';
import 'package:flikcar_inspection/widgets/upload1_image.dart';
import 'package:flikcar_inspection/widgets/upload_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExteriorDetails extends StatelessWidget {
  const ExteriorDetails({super.key});

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
    "Tyre Life (10%-29%)",
    "Tyre Life (30%-49%)",
    "Tyre Life (50%-79%)",
    "Tyre Life (80%-100%)",
  ];

  @override
  Widget build(BuildContext context) {
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
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "Upper Cross Member ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
              title: "Lower Cross Member ",
              onChanged: (value) {},
              dropdownItems: exterior,
            ),
            CustomDropDown(
                title: "Radiator Support ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "Headlight Support ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Apron ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Apron ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "Front Windshield ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "Firewall ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "Cowl Top ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "Roof ", onChanged: (value) {}, dropdownItems: exterior),
            CustomDropDown(
                title: "Front Bumper ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Headlamp ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Headlamp ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Foglamp ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Foglamp ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Fender ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Front Alloy ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Front Tyre ",
                onChanged: (value) {},
                dropdownItems: tyre),
            CustomDropDown(
                title: "LHS ORVM ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS A Pillar ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Front Door ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS B Pillar ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Rear Door ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS C Pillar ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Running Board ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Rear Alloy ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Rear Tyre  ",
                onChanged: (value) {},
                dropdownItems: tyre),
            CustomDropDown(
                title: "LHS Quarter Panel ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "Rear Bumper ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "LHS Tail lamp ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Tail lamp ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "Rear Windshield ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "Boot Door ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "Spare Tyre ",
                onChanged: (value) {},
                dropdownItems: tyre),
            CustomDropDown(
                title: "Boot Floor ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Quarter Panel ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Rear Alloy ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Rear Tyre ",
                onChanged: (value) {},
                dropdownItems: tyre),
            CustomDropDown(
                title: "RHS C Pillar ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Rear Door ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS B Pillar ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Front Door ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS A Pillar ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Running Board ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Front Alloy ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS Front Tyre ",
                onChanged: (value) {},
                dropdownItems: tyre),
            CustomDropDown(
                title: "RHS Fender ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "RHS ORVM ",
                onChanged: (value) {},
                dropdownItems: exterior),
            CustomDropDown(
                title: "Comments in Exterior ",
                onChanged: (value) {},
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
