import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        counterText: "",
        counterStyle: const TextStyle(color: Colors.transparent),
        hintText: "User name",
      ),
      maxLength: 30,
    );
  }
}
