import 'dart:io';

import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/image_source.dart';
import 'package:flutter/material.dart';

class Upload1Image extends StatelessWidget {
  final String title;
  final String image;
  final Function() galleryfunction;
  final Function() camerafunction;

  const Upload1Image(
      {super.key,
      required this.title,
      required this.image,
      required this.camerafunction,
      required this.galleryfunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppFonts.w700black16,
            ),
            const Text(
              " *",
              style: TextStyle(
                  color: Colors.red, fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        image == ""
            ? GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return ImageSource(
                          galleryFunction: () {
                            galleryfunction();
                          },
                          cameraFunction: () {
                            camerafunction();
                          },
                        );
                      });
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
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return ImageSource(
                          galleryFunction: () {
                            galleryfunction();
                          },
                          cameraFunction: () {
                            camerafunction();
                          },
                        );
                      });
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
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffE0E0E0),
                            ),
                          ),
                          child: const CircularProgressIndicator(),
                        );
                      }
                    },
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
