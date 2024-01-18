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
  final String vehicleId;
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
              type: "exterior",
              cameraFunction: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .carImagesCamera(context: context, type: "exterior");
              },
              galleryFunction: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .pickCarImages(context: context, type: "exterior");
              },
              imagePath: context.watch<UploadImagesService>().exteriorImages,
              title: "Exterior*",
            ),
            UploadImages(
              type: "interior",
              cameraFunction: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .carImagesCamera(context: context, type: "interior");
              },
              galleryFunction: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .pickCarImages(context: context, type: "interior");
              },
              imagePath: context.watch<UploadImagesService>().interiorImages,
              title: "Interior*",
            ),
            UploadImages(
              type: "engine",
              cameraFunction: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .carImagesCamera(context: context, type: "engine");
              },
              galleryFunction: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .pickCarImages(context: context, type: "engine");
              },
              imagePath: context.watch<UploadImagesService>().engineImages,
              title: "Engine*",
            ),
            UploadImages(
              type: "tyre",
              galleryFunction: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .pickCarImages(context: context, type: "tyre");
              },
              cameraFunction: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .carImagesCamera(context: context, type: "tyre");
              },
              imagePath: context.watch<UploadImagesService>().tyreImages,
              title: "Tyre*",
            ),
            UploadImages(
              type: "dents",
              galleryFunction: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .pickCarImages(context: context, type: "dents");
              },
              cameraFunction: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .carImagesCamera(context: context, type: "dents");
              },
              imagePath: context.watch<UploadImagesService>().dentsImages,
              title: "Dents",
            ),
            UploadImages(
              type: "others",
              galleryFunction: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .pickCarImages(context: context, type: "others");
              },
              cameraFunction: () {
                Provider.of<UploadImagesService>(context, listen: false)
                    .carImagesCamera(context: context, type: "others");
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
                thumbnail: context.watch<UploadImagesService>().engineVideoUrl),
            UploadVideo(
                title: "Exhaust Video",
                function: () {
                  Provider.of<UploadImagesService>(context, listen: false)
                      .pickVideo(context: context, type: "exhaust");
                },
                thumbnail:
                    context.watch<UploadImagesService>().exhaustVideoUrl),
            const SizedBox(
              height: 50,
            )
          ]),
        ),
        bottomNavigationBar: SafeArea(
            child: Container(
          padding: const EdgeInsets.only(top: 8),
          child: PrimaryButton(
            title: "Next",
            function: () {
              Provider.of<UploadImagesService>(context, listen: false)
                  .uploadAuctionCarImages(carId: vehicleId, context: context);
              // Provider.of<VehicleInspectionService>(context, listen: false)
              //     .increaseIndex();
            },
            borderColor: const Color(0xff161F31),
            backgroundColor: const Color(0xff161F31),
            textStyle: AppFonts.w500white14,
          ),
        )));
  }
}
