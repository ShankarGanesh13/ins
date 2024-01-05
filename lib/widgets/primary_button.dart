import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function() function;
  final Color borderColor;
  final TextStyle textStyle;
  final Color backgroundColor;
  const PrimaryButton(
      {super.key,
      required this.title,
      required this.function,
      required this.borderColor,
      required this.backgroundColor,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(8),
          side: BorderSide(color: borderColor),
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: function,
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
