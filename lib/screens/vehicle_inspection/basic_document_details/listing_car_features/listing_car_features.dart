import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/car_comfort.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/car_entertainment.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/car_exterior.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/car_interior.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/car_safety.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListingCarFatures extends StatefulWidget {
  const ListingCarFatures({super.key});

  @override
  State<ListingCarFatures> createState() => _ListingCarFaturesState();
}

class _ListingCarFaturesState extends State<ListingCarFatures> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CarComfort(),
        const CarSafety(),
        const CarInterior(),
        const CarExterior(),
        const CarEntertainment(),
      ],
    );
  }
}
