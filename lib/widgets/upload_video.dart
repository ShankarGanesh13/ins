import 'dart:io';

import 'package:flikcar_inspection/services/upload_engine_transmisson.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadVideo extends StatelessWidget {
  final String title;
  final Function() function;
  final String thumbnail;
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
        thumbnail == ""
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
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6, bottom: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffE0E0E0)),
                      ),
                      child: Image.file(
                        File(thumbnail),
                        height: 100,
                        width: MediaQuery.of(context).size.width / 2.5,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                        height: MediaQuery.of(context).size.height / 7,
                        width: MediaQuery.of(context).size.height / 5,
                        child: const Icon(
                          Icons.video_call_outlined,
                          color: Color.fromARGB(255, 197, 197, 197),
                          size: 35,
                        ))
                  ],
                ),
              ),
        Text(
          "Max Duration 20 sec",
          style: AppFonts.w500black11,
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
