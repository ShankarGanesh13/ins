import 'package:flikcar_inspection/screens/completed_inspection/completed_inspection.dart';
import 'package:flikcar_inspection/screens/profile/profile_screen.dart';
import 'package:flikcar_inspection/screens/upcoming_inspection/upcoming_inspection.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/vehicle_inspection.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: CustomAppbar(),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VehicleInspection(),
                  ));
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              child: Row(children: [
                Image.asset(
                  "assets/app_icons/inspection_icon.png",
                  height: 24,
                  width: 24,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Vehicle Inspection",
                  style: AppFonts.w500blue18,
                )
              ]),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpcomingInspection()));
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              child: Row(children: [
                Image.asset(
                  "assets/app_icons/upcoming_inspection.png",
                  height: 24,
                  width: 24,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Upcoming Inspection",
                  style: AppFonts.w500blue18,
                )
              ]),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CompletedInspection()));
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              child: Row(children: [
                Image.asset(
                  "assets/app_icons/inspection_complete.png",
                  height: 24,
                  width: 24,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Completed Inspection",
                  style: AppFonts.w500blue18,
                )
              ]),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              child: Row(children: [
                Image.asset(
                  "assets/app_icons/profile_icon.png",
                  height: 24,
                  width: 24,
                  color: Color(0xff161F31),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Profile",
                  style: AppFonts.w500blue18,
                )
              ]),
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
