import 'package:flikcar_inspection/screens/home_screen/home_screen.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/features_checkbox.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/comfort_conveniance/widgets/comment_on_comfort.dart';
import 'package:flikcar_inspection/services/upload_basic_details.dart';
import 'package:flikcar_inspection/services/upload_comfort_details.dart';
import 'package:flikcar_inspection/services/upload_images.dart';
import 'package:flikcar_inspection/services/vehicle_inspection_service.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/custom_dropdown.dart';
import 'package:flikcar_inspection/widgets/primary_button.dart';
import 'package:flikcar_inspection/widgets/upload_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComfortConveniance extends StatelessWidget {
  final String vehicleId;
  const ComfortConveniance({super.key, required this.vehicleId});
  static String? airCondition;
  static String? climateControl;
  static String? musicControl;
  static String? stereo;
  static String? inbuiltSpeaker;
  static String? externalSpeaker;
  static String? steeringMountedAudioControl;
  static String? sunroof;
  static String? commentsOnComfort;

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
                  airCondition = value;
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
                  climateControl = value;
                },
                dropdownItems: const [
                  "Not Applicable",
                  "Okay",
                  "Ineffective",
                  "Not Working"
                ]),
            CustomDropDown(
                title: "Music Control ",
                onChanged: (value) {
                  musicControl = value;
                },
                dropdownItems: const [
                  "Not Available",
                  "Available",
                  "Not working",
                  "Speaker Not Working",
                ]),
            CustomDropDown(
                title: "Stereo ",
                onChanged: (value) {
                  stereo = value;
                },
                dropdownItems: const [
                  "Not Applicable",
                  "Normal Stereo",
                  "Touch Stereo",
                ]),
            CustomDropDown(
                title: "Inbuilt Speaker ",
                onChanged: (value) {
                  inbuiltSpeaker = value;
                },
                dropdownItems: const [
                  "Not Applicable",
                  "Available",
                  "Not Working"
                ]),
            CustomDropDown(
                title: "External Speaker ",
                onChanged: (value) {
                  externalSpeaker = value;
                },
                dropdownItems: const [
                  "Not Applicable",
                  "Available",
                  "Not Working"
                ]),
            CustomDropDown(
                title: "Steering Mounted Audo Control ",
                onChanged: (value) {
                  steeringMountedAudioControl = value;
                },
                dropdownItems: const [
                  "Not Applicable",
                  "Available",
                  "Not Working"
                ]),
            CustomDropDown(
                title: "Sunroof ",
                onChanged: (value) {
                  sunroof = value;
                },
                dropdownItems: const [
                  "Not Applicable",
                  "Available",
                  "Not Working",
                  "Noisy"
                ]),
            Text(
              "Comments on Comfort Details",
              style: AppFonts.w700black16,
            ),
            const SizedBox(
              height: 20,
            ),
            CommentOnComfort(
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
                Provider.of<UploadComfortDetailsService>(context, listen: false)
                    .uploadComfortDetails(
                        carId: vehicleId,
                        climateControl: climateControl,
                        externalSpeaker: externalSpeaker,
                        inbuiltSpeaker: inbuiltSpeaker,
                        manualAC: airCondition,
                        musicSystem: musicControl,
                        steeringMountedAudioControl:
                            steeringMountedAudioControl,
                        stereo: stereo,
                        sunroof: sunroof);
                Provider.of<VehicleInspectionService>(context, listen: false)
                    .increaseIndex();

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 4),
                    backgroundColor: Color(0xFF45C08D),
                    content: Text("Car details uploaded"),
                  ),
                );
                Provider.of<UploadBasicDetailsService>(context, listen: false)
                    .clearImages();
                Provider.of<UploadImagesService>(context, listen: false)
                    .clearAllImages();
              },
              borderColor: const Color(0xff161F31),
              backgroundColor: const Color(0xff161F31),
              textStyle: AppFonts.w500white14),
        ),
      ),
    );
  }
}
