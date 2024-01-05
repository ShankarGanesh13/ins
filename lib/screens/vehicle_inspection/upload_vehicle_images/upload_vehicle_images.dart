import 'package:flikcar_inspection/services/upload_images.dart';
import 'package:flikcar_inspection/services/vehicle_inspection_service.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/primary_button.dart';
import 'package:flikcar_inspection/widgets/upload1_image.dart';
import 'package:flikcar_inspection/widgets/upload_images.dart';
import 'package:flikcar_inspection/widgets/upload_video.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadVehicleImages extends StatelessWidget {
  final int vehicleId;
  const UploadVehicleImages({super.key, required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Car Images",
              style: AppFonts.w700black20,
            ),
            const SizedBox(
              height: 20,
            ),
            UploadImages(
              function: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .pickCarImages(context: context, type: "exterior");
              },
              imagePath: context.watch<UploadImagesService>().exteriorImages,
              title: "Exterior*",
            ),
            UploadImages(
              function: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .pickCarImages(context: context, type: "interior");
              },
              imagePath: context.watch<UploadImagesService>().interiorImages,
              title: "Interior*",
            ),
            UploadImages(
              function: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .pickCarImages(context: context, type: "engine");
              },
              imagePath: context.watch<UploadImagesService>().engineImages,
              title: "Engine*",
            ),
            UploadImages(
              function: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .pickCarImages(context: context, type: "tyre");
              },
              imagePath: context.watch<UploadImagesService>().tyreImages,
              title: "Tyre*",
            ),
            UploadImages(
              function: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .pickCarImages(context: context, type: "dents");
              },
              imagePath: context.watch<UploadImagesService>().dentsImages,
              title: "Dents",
            ),
            UploadImages(
              function: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .pickCarImages(context: context, type: "others");
              },
              imagePath: context.watch<UploadImagesService>().otherImages,
              title: "Others",
            ),
            UploadVideo(
                title: "Engine Video",
                function: () {
                  Provider.of<UploadImagesService>(context, listen: false)
                      .pickVideo(context: context, type: "engine");
                },
                thumbnail: ""),
            UploadVideo(title: "Exhaust Video", function: () {}, thumbnail: ""),
            const SizedBox(
              height: 50,
            )
          ]),
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
        )));
  }
}
