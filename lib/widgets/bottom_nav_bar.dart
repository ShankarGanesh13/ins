import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0, -10),
          blurRadius: 18,
        )
      ]),
      child: PrimaryButton(
          title: "Submit Report",
          function: () {},
          borderColor: Color(0xff161F31),
          backgroundColor: Color(0xff161F31),
          textStyle: AppFonts.w500white14),
    );
  }
}
