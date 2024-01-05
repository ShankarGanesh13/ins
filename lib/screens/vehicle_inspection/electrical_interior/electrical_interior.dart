import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/features_checkbox.dart';
import 'package:flikcar_inspection/services/upload_electrical_interior.dart';
import 'package:flikcar_inspection/services/vehicle_inspection_service.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/custom_dropdown.dart';
import 'package:flikcar_inspection/widgets/custom_textfield.dart';
import 'package:flikcar_inspection/widgets/primary_button.dart';
import 'package:flikcar_inspection/widgets/upload1_image.dart';
import 'package:flikcar_inspection/widgets/upload_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ElectricalInterior extends StatelessWidget {
  const ElectricalInterior({super.key});

  static final controller = TextEditingController();

  static String odometerReading = "";
  static String fuelLevel = "";
  static String abs = "";
  static String electrical = "";
  static String rearWiperWasher = "";
  static String rearDefogger = "";
  static String powerWindows = "";
  static String powerWindowsRhsFront = "";
  static String powerWindowsLhsFront = "";
  static String powerWindowsRhsRear = "";
  static String powerWindowsLhsRear = "";
  static String commentsOnInterior = "";
  static String leatherSeats = "";
  static String fabricSeats = "";
  static String commentsOnElectrical = "";
  static List<String> powerWindowOptions = [
    "Not Applicable",
    "Working",
    "Not Working",
    "Missing",
    "Broken/Damaged",
    "Noisy"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Electrical & Interior",
              style: AppFonts.w700black20,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                title: "Odometer Reading",
                controller: controller,
                keyboardType: TextInputType.number,
                maxLength: 7,
                onChanged: (value) {
                  odometerReading = value;
                  print("odometerReading $odometerReading");
                },
                validator: true),
            CustomDropDown(
                title: "Fuel Level ",
                onChanged: (value) {},
                dropdownItems: const [
                  "Reserve",
                  "Less than 25%",
                  "25% to 50%",
                  "More than 50%"
                ]),
            // CustomDropDown(
            //     title: "ABS ",
            //     onChanged: (value) {},
            //     dropdownItems: const ["Option 1", "Option 2", "Option3"]),
            CustomDropDown(
                title: "Electricals ",
                onChanged: (value) {},
                dropdownItems: const [
                  "Okay",
                  "Odometer Not Working",
                  "Speedometer Not Working",
                  "Central Locking Not Working",
                  "Remote Locking Not Working"
                ]),
            CustomDropDown(
                title: "Rear Wiper and Washer ",
                onChanged: (value) {},
                dropdownItems: const [
                  "Not Applicable",
                  "Okay",
                  "Broken",
                  "Not Working"
                ]),
            CustomDropDown(
                title: "Rear Defogger ",
                onChanged: (value) {},
                dropdownItems: const ["Not Applicable", "Okay", "Not Working"]),
            CustomDropDown(
                title: "Power Windows ",
                onChanged: (value) {},
                dropdownItems: const ["2", "4"]),
            CustomDropDown(
                title: "Power Windows RHS Front ",
                onChanged: (value) {},
                dropdownItems: powerWindowOptions),
            CustomDropDown(
                title: "Power Windows LHS Front ",
                onChanged: (value) {},
                dropdownItems: powerWindowOptions),
            CustomDropDown(
                title: "Power Windows LHS Rear ",
                onChanged: (value) {},
                dropdownItems: powerWindowOptions),
            CustomDropDown(
                title: "Power Windows RHS Rear ",
                onChanged: (value) {},
                dropdownItems: powerWindowOptions),
            //
            //
            //
            CustomDropDown(
                title: "Comments on Interior ",
                onChanged: (value) {},
                dropdownItems: powerWindowOptions),
            //
            //
            //
            CustomDropDown(
                title: "Leather Seats ",
                onChanged: (value) {},
                dropdownItems: const [
                  "Not Applicable",
                  "Okay",
                  "Torn",
                  "Worn Out",
                  "Cushion Damaged"
                ]),
            CustomDropDown(
                title: "Fabric Seats ",
                onChanged: (value) {},
                dropdownItems: const [
                  "Not Applicable",
                  "Okay",
                  "Torn",
                  "Worn Out",
                  "Cushion Damaged"
                ]),
            //
            //
            //
            CustomTextField(
                title: "Comments on Electricals ",
                controller: controller,
                keyboardType: TextInputType.number,
                maxLength: 70,
                onChanged: (value) {},
                validator: true),
            //
            //
            //
            Text(
              "Comments on Electrical",
              style: AppFonts.w700black16,
            ),
            const SizedBox(
              height: 20,
            ),
            FeatureCheckbox(
              features: context
                  .watch<UploadElectricalInteriorService>()
                  .commentsOnElectrical,
              feature: "commentOnBasicDetails",
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
