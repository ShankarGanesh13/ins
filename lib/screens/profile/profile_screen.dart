import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAppbar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(22, 31, 49, 0.10),
                Color.fromRGBO(69, 192, 141, 0.10)
              ],
            )),
            child: Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.chevron_left,
                  color: Color(0xff45C08D),
                ),
              ),
              Text(
                "Profile",
                style: AppFonts.w700black16,
              ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Username",
                  style: AppFonts.w700blue16,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Test user",
                  style: AppFonts.w500dark214,
                ),
              ],
            ),
          ),
          const Divider(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contact Support",
                  style: AppFonts.w700blue16,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "+91 9876754323",
                  style: AppFonts.w500dark214,
                ),
              ],
            ),
          ),
          const Divider(
            height: 12,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Spacer(),
              const Icon(Icons.login),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Logout",
                style: AppFonts.w500blue14,
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          )
        ],
      ),
    );
  }
}
