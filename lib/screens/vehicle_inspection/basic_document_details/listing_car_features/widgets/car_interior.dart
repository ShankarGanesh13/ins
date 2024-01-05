import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/features_checkbox.dart';
import 'package:flikcar_inspection/services/upload_basic_details.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarInterior extends StatelessWidget {
  const CarInterior({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Interior",
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 20,
        ),
        FeatureCheckbox(
          features: context.watch<UploadBasicDetailsService>().interiorFeatures,
          feature: "interior",
        )
      ],
    );
  }
}
