import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/features_checkbox.dart';
import 'package:flikcar_inspection/services/get_basic_details.dart';
import 'package:flikcar_inspection/services/upload_basic_details.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarComfort extends StatefulWidget {
  const CarComfort({super.key});

  @override
  State<CarComfort> createState() => _CarComfortState();
}

class _CarComfortState extends State<CarComfort> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            "Comfort",
            style: AppFonts.w700black16,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FeatureCheckbox(
          features: context.watch<UploadBasicDetailsService>().comfortFeatures,
          feature: "comfort",
        )
      ],
    );
  }
}
//  FutureBuilder<List<FeatureModel>>(
//               future: DealerUploadCar.getComfortFeatures(),
//               builder: (context, snapshot) {
//                 if (snapshot.data != null) {
//                   return FeatureCheckbox(features: snapshot.data!);
//                 } else {
//                   return const LoadingWidget();
//                 }
//               }),
//  const BoolDropdownTextField(
//               title: "Anti-glare mirrors-manual", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Power-windows", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Air-conditioner", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Power steering", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "12V power outlets", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Seat lumbar support", selectedValue: ""),
//           const BoolDropdownTextField(title: "Cup holders", selectedValue: ""),
//           const BoolDropdownTextField(title: "Clock", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Voice command/control", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Ventilated seats rear", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Ventilated seats", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Cruise control", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Automatic climate control", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Rear AC vents", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Traction control", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Steering wheel gearshift paddles", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Keyless start", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Glove box cooling", selectedValue: ""),
//           const BoolDropdownTextField(title: "Armrest", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Keyless entry", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Vanity mirror on sun visors", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Adjustable  headrests", selectedValue: ""),
//           const BoolDropdownTextField(title: "Trunk light", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Gear indicator", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Rear reading lamp", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Remote trunk opener", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Remote fuel lid opener", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Rear window blind", selectedValue: ""),
//           const BoolDropdownTextField(
//               title: "Luggage hook and net", selectedValue: ""),