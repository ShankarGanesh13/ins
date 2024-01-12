import 'package:flikcar_inspection/screens/home_screen/home_screen.dart';
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
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false);
            },
            child: Image.asset(
              "assets/app_icons/white_app_icon.png",
              height: 55,
              width: 55,
              fit: BoxFit.fill,
            ),
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
