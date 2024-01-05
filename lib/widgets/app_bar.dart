import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xff161F31),
      title: Row(
        children: [
          Image.asset(
            "assets/app_icons/white_app_icon.png",
            height: 55,
            width: 55,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            "Flikcar Inspection Panel",
            style: AppFonts.w700white16,
          ),
        ],
      ),
    );
  }
}
