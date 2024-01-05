import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class UpcomingInspectionCard extends StatelessWidget {
  const UpcomingInspectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(2),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Car Varient",
                  style: AppFonts.w700black16,
                ),
                Text(
                  "Car Brand",
                  style: AppFonts.w500dark214,
                ),
              ],
            ),
            Spacer(),
            Text(
              "Inspection ID: Flikcar001",
              style: AppFonts.w500black12,
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "Customer Name: Testing",
          style: AppFonts.w500black12,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "Date: 13-09-2023",
          style: AppFonts.w700black15,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 35,
              width: MediaQuery.of(context).size.width / 2.6,
              child: PrimaryButton(
                  title: "Mark as Complete",
                  function: () {},
                  borderColor: Color(0xff161F31),
                  backgroundColor: Colors.white,
                  textStyle: AppFonts.w500blue14),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2.6,
              height: 35,
              child: PrimaryButton(
                  title: "Contact Customer",
                  function: () {},
                  borderColor: Color(0xff161F31),
                  backgroundColor: Color(0xff161F31),
                  textStyle: AppFonts.w500white14),
            ),
            Text(
              "Cancel",
              style: AppFonts.w500black12,
            )
          ],
        ),
      ]),
    );
  }
}
