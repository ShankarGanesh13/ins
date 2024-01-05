import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/features_checkbox.dart';
import 'package:flikcar_inspection/services/upload_comfort_details.dart';
import 'package:flikcar_inspection/services/vehicle_inspection_service.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/custom_dropdown.dart';
import 'package:flikcar_inspection/widgets/primary_button.dart';
import 'package:flikcar_inspection/widgets/upload_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComfortConveniance extends StatelessWidget {
  const ComfortConveniance({super.key});
  static String airCondition = "";
  static String climateControl = "";
  static String musicControl = "";
  static String stereo = "";
  static String inbuiltSpeaker = "";
  static String externalSpeaker = "";
  static String steeringMountedAudioControl = "";
  static String sunroof = "";
  static String commentsOnComfort = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Comfort & Conveniance",
              style: AppFonts.w700black20,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomDropDown(
                title: "Air Condition ",
                onChanged: (value) {
                  //manual ac
                },
                dropdownItems: const [
                  "Not Applicable",
                  "Okay",
                  "Ineffective",
                  "Not Working"
                ]),
            CustomDropDown(
                title: "Automatic Climate Control ",
                onChanged: (value) {
                  //climateControl
                },
                dropdownItems: const [
                  "Not Applicable",
                  "Okay",
                  "Ineffective",
                  "Not Working"
                ]),
            CustomDropDown(
                title: "Music Control ",
                onChanged: (value) {},
                dropdownItems: const [
                  "Not Available",
                  "Available",
                  "Not working",
                  "Speaker Not Working",
                ]),
            CustomDropDown(
                title: "Stereo ",
                onChanged: (value) {},
                dropdownItems: const [
                  "Not Applicable",
                  "Normal Stereo",
                  "Touch Stereo",
                ]),
            CustomDropDown(
                title: "Inbuilt Speaker ",
                onChanged: (value) {},
                dropdownItems: const [
                  "Not Applicable",
                  "Available",
                  "Not Working"
                ]),
            CustomDropDown(
                title: "External Speaker ",
                onChanged: (value) {},
                dropdownItems: const [
                  "Not Applicable",
                  "Available",
                  "Not Working"
                ]),
            CustomDropDown(
                title: "Steering Mounted Audo Control ",
                onChanged: (value) {},
                dropdownItems: const [
                  "Not Applicable",
                  "Available",
                  "Not Working"
                ]),
            CustomDropDown(
                title: "Sunroof ",
                onChanged: (value) {},
                dropdownItems: const [
                  "Not Applicable",
                  "Available",
                  "Not Working",
                  "Noisy"
                ]),
            CustomDropDown(
                title: "Comments of comfort ",
                onChanged: (value) {},
                dropdownItems: const ["option 1", "option 2", "option 3"]),
            Text(
              "Comments on Basic Details",
              style: AppFonts.w700black16,
            ),
            const SizedBox(
              height: 20,
            ),
            FeatureCheckbox(
              features:
                  context.watch<UploadComfortDetailsService>().commentOnComfort,
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
              title: "Upload",
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
