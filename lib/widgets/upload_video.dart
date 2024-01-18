import 'dart:io';

import 'package:flikcar_inspection/services/upload_engine_transmisson.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadVideo extends StatelessWidget {
  final String title;
  final Function() function;
  final String? thumbnail;
  const UploadVideo(
      {super.key,
      required this.title,
      required this.function,
      required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.w700black16,
        ),
        thumbnail == null
            ? GestureDetector(
                onTap: () {
                  function();
                },
                child: Container(
                  height: 120,
                  margin: const EdgeInsets.only(top: 6, bottom: 5),
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffE0E0E0)),
                  child: const Icon(
                    Icons.video_call,
                    size: 40,
                    color: Color(0xff606060),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  function();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 6, bottom: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffE0E0E0)),
                  ),
                  child: Image.network(
                    title == "Engine Video"
                        ? "https://firebasestorage.googleapis.com/v0/b/flikcar-bac6e.appspot.com/o/001.jpg?alt=media&token=58caa43d-3141-4969-a8ed-d10c51ea8cac"
                        : "https://firebasestorage.googleapis.com/v0/b/flikcar-bac6e.appspot.com/o/002.jpg?alt=media&token=d47b010c-7b7f-4b9b-ab25-e99e1c31db53",
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2.5,
                    fit: BoxFit.contain,
                  ),
                ),
                // Positioned(
                //     height: MediaQuery.of(context).size.height / 7,
                //     width: MediaQuery.of(context).size.height / 5,
                //     child: const Icon(
                //       Icons.video_call_outlined,
                //       color: Color.fromARGB(255, 197, 197, 197),
                //       size: 35,
                //     ))
              ),
        Text(
          "Max Duration 30 sec",
          style: AppFonts.w500black11,
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
