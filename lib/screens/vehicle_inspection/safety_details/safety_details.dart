import 'package:flikcar_inspection/services/vehicle_inspection_service.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/custom_dropdown.dart';
import 'package:flikcar_inspection/widgets/custom_textfield.dart';
import 'package:flikcar_inspection/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SafetyDetails extends StatelessWidget {
  const SafetyDetails({super.key});
  static TextEditingController controller = TextEditingController();
  static String airbag = "";
  static String noOfAirbags = "";
  static String driverSide = "";
  static String coDriverSide = "";
  static String lhsAPillar = "";
  static String lhsBPillar = "";
  static String lhsCPillar = "";
  static String rhsAPillar = "";
  static String rhsBPillar = "";
  static String rhsCPillar = "";
  static String reverseCamera = "";

  // static String = "";
  static List<String> airbagCondition = [
    "Not Applicable",
    "Okay",
    "Deployed",
    "Removed",
    "Airbag Warning Light Glowing"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Safety Details",
              style: AppFonts.w700black20,
            ),
            const SizedBox(
              height: 20,
            ),

            // CustomDropDown(
            //     title: "Airbags ",
            //     onChanged: (value) {},
            //     dropdownItems: const ["", "", ""]),
            CustomTextField(
                title: "No. of Airbags ",
                controller: controller,
                keyboardType: TextInputType.number,
                maxLength: 2,
                onChanged: (value) {},
                validator: true),
            CustomDropDown(
                title: "ABS ",
                onChanged: (value) {},
                dropdownItems: const [
                  "Not Applicable",
                  "Okay",
                  "Warning Light Glowing"
                ]),
            CustomDropDown(
                title: "Driver Side ",
                onChanged: (value) {},
                dropdownItems: airbagCondition),
            CustomDropDown(
                title: "Co-Driver Side ",
                onChanged: (value) {},
                dropdownItems: airbagCondition),
            CustomDropDown(
                title: "LHS A Piller ",
                onChanged: (value) {},
                dropdownItems: airbagCondition),
            CustomDropDown(
                title: "LHS B Piller ",
                onChanged: (value) {},
                dropdownItems: airbagCondition),
            CustomDropDown(
                title: "LHS C Piller ",
                onChanged: (value) {},
                dropdownItems: airbagCondition),
            CustomDropDown(
                title: "RHS A Piller ",
                onChanged: (value) {},
                dropdownItems: airbagCondition),
            CustomDropDown(
                title: "RHS B Piller ",
                onChanged: (value) {},
                dropdownItems: airbagCondition),
            CustomDropDown(
                title: "RHS C Piller ",
                onChanged: (value) {},
                dropdownItems: airbagCondition),
            CustomDropDown(
                title: "Reverse Parking Camera ",
                onChanged: (value) {},
                dropdownItems: const [
                  "Okay",
                  "Not Applicable",
                  "Hazy",
                  "Damaged/Not working"
                ]),
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
