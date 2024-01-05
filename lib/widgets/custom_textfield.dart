import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final ValueChanged onChanged;
  final TextInputType keyboardType;
  final bool validator;
  final int maxLength;
  const CustomTextField(
      {super.key,
      required this.title,
      required this.controller,
      required this.keyboardType,
      required this.maxLength,
      required this.onChanged,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.w500black14,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 55,
          child: TextFormField(
            keyboardType: keyboardType,
            //  controller: controller,
            onChanged: (value) {
              onChanged(value);
            },
            decoration: InputDecoration(
                errorStyle: const TextStyle(fontSize: 10, height: 1),
                contentPadding:
                    const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                counterText: "222",
                counterStyle:
                    const TextStyle(color: Colors.transparent, fontSize: 10),
                hintText: "",
                hintStyle: AppFonts.w500dark214),
            maxLength: maxLength,
            style: AppFonts.w500black12,
            validator: (value) {
              if (validator == true) {
                if (value == null) {
                  return "Enter a valid data";
                } else if (value == "") {
                  return "Enter a valid data";
                }
              }
              return null;
            },
            maxLines: 1,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
