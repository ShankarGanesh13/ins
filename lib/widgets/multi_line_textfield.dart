import 'package:flutter/material.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';

class MultiLineTextfield extends StatelessWidget {
  final String title;
  final ValueChanged onChanged;
  final TextInputType keyboardType;
  final bool validator;

  const MultiLineTextfield({
    Key? key,
    required this.title,
    required this.keyboardType,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppFonts.w500black14,
            ),
            validator == true
                ? const Text(
                    " *",
                    style: TextStyle(color: Colors.red),
                  )
                : const SizedBox()
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          keyboardType: keyboardType,
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
            hintText: "",
            hintStyle: AppFonts.w500dark214,
          ),
          style: AppFonts.w500black14,
          validator: (value) {
            if (validator == true) {
              if (value == null || value.isEmpty) {
                return "Enter a valid data";
              }
            }
            return null;
          },
          //  expands: true,
          maxLines: 6,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
