import 'dart:io';

import 'package:flikcar_inspection/models/image_model.dart';
import 'package:flikcar_inspection/services/upload_images.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/image_source.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadImages extends StatelessWidget {
  final String title;
  final String type;
  final List<ImageModel> imagePath;
  final Function() cameraFunction;
  final Function() galleryFunction;

  const UploadImages({
    super.key,
    required this.type,
    required this.title,
    required this.cameraFunction,
    required this.imagePath,
    required this.galleryFunction,
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
                  //  function();
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return ImageSource(
                          galleryFunction: () {
                            galleryFunction();
                          },
                          cameraFunction: () {
                            cameraFunction();
                          },
                        );
                      });
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
                            Row(
                              children: [
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Provider.of<UploadImagesService>(context,
                                            listen: false)
                                        .removeImage(
                                            image: imagePath[index],
                                            context: context,
                                            type: type);
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: Image.network(
                                imagePath[index].path,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        color: const Color(0xffE0E0E0),
                                      )),
                                      child: const Icon(Icons.error));
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        color: const Color(0xffE0E0E0),
                                      )),
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
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
          "Upload upto 10 images",
          style: AppFonts.w500black11,
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
