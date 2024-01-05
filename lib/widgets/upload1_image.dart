import 'dart:io';

import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class Upload1Image extends StatelessWidget {
  final String title;
  final String image;
  final Function() function;

  const Upload1Image(
      {super.key,
      required this.title,
      required this.image,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.w700black16,
        ),
        image == ""
            ? GestureDetector(
                onTap: () {
                  function();
                },
                child: Container(
                  height: 150,
                  margin: const EdgeInsets.only(top: 6, bottom: 15),
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffE0E0E0)),
                  child: const Icon(
                    Icons.add_a_photo_outlined,
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
                    image,
                    height: 150,
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
