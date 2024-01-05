import 'dart:io';

import 'package:flikcar_inspection/models/image_model.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/image_source.dart';
import 'package:flutter/material.dart';

class UploadImages extends StatelessWidget {
  final String title;

  final List<ImageModel> imagePath;
  final Function() function;

  const UploadImages({
    super.key,
    required this.title,
    required this.function,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff606060)),
              borderRadius: BorderRadius.circular(5)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              GestureDetector(
                onTap: () {
                  function();
                  // showModalBottomSheet<void>(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return ImageSource(
                  //         galleryFunction: function,
                  //       );
                  //     });
                },
                child: Container(
                  height: 130,
                  width: 150,
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: const Color(0xffE0E0E0),
                  ),
                  child: const Icon(
                    Icons.add_a_photo_outlined,
                    color: Color(0xff606060),
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 130,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: imagePath.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 130,
                        width: 150,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffE0E0E0)),
                        ),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Spacer(),
                                Icon(
                                  Icons.close,
                                  size: 20,
                                )
                              ],
                            ),
                            Image.network(
                              imagePath[index].path,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ]),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          "Upload images",
          style: AppFonts.w500black11,
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
