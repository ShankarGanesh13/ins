import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/app_bar.dart';
import 'package:flikcar_inspection/widgets/primary_button.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'package:flikcar_inspection/screens/image_editor_screen/boxer_model.dart';
import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector_pro/matrix_gesture_detector_pro.dart';
import 'package:uuid/uuid.dart';

class ImageEditorScreen extends StatefulWidget {
  final File image;
  
  const ImageEditorScreen({super.key, required this.image});

  @override
  State<ImageEditorScreen> createState() => _ImageEditorScreenState();
}

class _ImageEditorScreenState extends State<ImageEditorScreen> {
  Matrix4? matrix;
  late ValueNotifier<Matrix4?> notifier;
  late Boxer boxer;
  // bool numberPlate = false;
  img.Image? editedImage;
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    matrix = Matrix4.identity();
    notifier = ValueNotifier(matrix);
  }

  var width = 100.0;
  var height = 30.0;
  var dx = 100.0;
  var dy = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAppbar(),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15, top: 30, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Please Note: ",
                    style: AppFonts.w700black15,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "- Please make sure image ratio is 9:16",
                    style: AppFonts.w500black14,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "- Image should be clicked in landscape",
                    style: AppFonts.w500black14,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: LayoutBuilder(
                builder: (ctx, constraints) {
                  boxer = Boxer(Offset.zero & constraints.biggest,
                      Rect.fromLTWH(0.0, 0.0, width, height));
                  return MatrixGestureDetector(
                    shouldRotate: false,
                    onMatrixUpdate: (m, tm, sm, rm) {
                      matrix =
                          MatrixGestureDetector.compose(matrix!, tm, sm, rm);
                      boxer.clamp(matrix!);
                      notifier.value = matrix;
                    },
                    child: Container(
                      margin: const EdgeInsets.all(0.5),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          //   Center(child: Image.file(widget.image)),
                          Center(
                              child: SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                                child: Image.file(
                              widget.image,
                              fit: BoxFit.cover,
                            )),
                          )),

                          Positioned(
                              child: AnimatedBuilder(
                            builder: (ctx, child) {
                              return Transform(
                                transform: matrix!,
                                child: Container(
                                  width: width,
                                  height: height,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black45,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(2),
                                    ),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      "assets/app_images/numberplate.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            },
                            animation: notifier,
                          )),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // editedImage != null
            //     ? SizedBox(
            //         height: 200,
            //         child: Image.memory(
            //           Uint8List.fromList(img.encodePng(editedImage!)),
            //           fit: BoxFit.contain, // Adjust the fit based on your needs
            //         ),
            //       )
            //     : SizedBox()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        child: PrimaryButton(
            title: "Upload",
            function: () {
              editImage(backgroundFile: widget.image, matrix1: matrix!);
            },
            borderColor: Color(0xff161F31),
            backgroundColor: Color(0xff161F31),
            textStyle: AppFonts.w500white14),
      ),
    );
  }

  editImage({
    required File backgroundFile,
    required Matrix4 matrix1,
  }) async {
    debugPrint("edit image called");
    img.Image background =
        img.decodeImage(File(backgroundFile.path).readAsBytesSync())!;
    final ByteData data =
        await rootBundle.load('assets/app_images/numberplate.jpg');
    final List<int> bytes = data.buffer.asUint8List();
    img.Image icon = img.decodeImage(Uint8List.fromList(bytes))!;
    Rect transformedBox = MatrixUtils.transformRect(matrix1, boxer.src);

    img.compositeImage(
      background,
      icon,
      dstX: transformedBox.left.toInt() * 10,
      dstY: (transformedBox.top.toInt() * 11).toInt(),
      dstH: (transformedBox.height.toInt() * 10).toInt(),
      dstW: (transformedBox.width.toInt() * 12).toInt(),
    );

    List<int> editedImageBytes = img.encodePng(background);
    String filename = Uuid().v1();
    setState(() {
      editedImage = img.decodeImage(Uint8List.fromList(editedImageBytes));
    });
    Reference storageReference =
        storage.ref().child('edited_images/$filename.png');
    await storageReference
        .putData(Uint8List.fromList(img.encodePng(background)!));

    // Get the download URL of the uploaded image
    String imageUrl = await storageReference.getDownloadURL();

    // Now you can use the 'imageUrl' as needed
    print('Uploaded image URL: $imageUrl');
  }
}
