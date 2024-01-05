import 'package:flikcar_inspection/services/upload_images.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class ImageSource extends StatelessWidget {
  final Function() galleryFunction;

  const ImageSource({super.key, required this.galleryFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Select Source",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Divider(),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    UploadImagesService()
                        .selectImageFromCamera(context: context);

                    // imagePath = await selectImageFromCamera();
                    // if (imagePath != "") {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => DragWidget2(
                    //         image: File(imagePath),
                    //       ),
                    //     ),
                    //   );
                    // } else {
                    //   print("No image is selected");
                    // }
                  },
                  child: const Column(
                    children: [
                      Icon(
                        Icons.camera,
                        size: 30,
                      ),
                      Text("Camera"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                  width: 3,
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                    width: 10,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //  UploadImages().selectImageFromGallery(context: context);
                    galleryFunction();
                  },
                  child: const Column(
                    children: [
                      Icon(
                        Icons.photo,
                        size: 30,
                      ),
                      Text("Gallery"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                  width: 3,
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                    width: 10,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Column(
                    children: [
                      Icon(
                        Icons.edit,
                        size: 30,
                      ),
                      Text(
                        "Edit",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: AppFonts.w500black14,
                ))
          ],
        ),
      ),
    );
  }
}
