import 'package:flikcar_inspection/screens/home_screen/home_screen.dart';
import 'package:flikcar_inspection/screens/login_screen/widgets/login_textfield.dart';
import 'package:flikcar_inspection/services/auth_service.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  String email = "";
  String password = "";
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161F31),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(
                "assets/app_images/login_background.png",
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      "INSPECTION PANEL",
                      style: AppFonts.w700white24,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Login",
                      style: AppFonts.w700green20,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                              left: 12, right: 12, top: 6, bottom: 6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          counterText: "",
                          counterStyle:
                              const TextStyle(color: Colors.transparent),
                          hintText: "Email",
                          hintStyle: AppFonts.w500dark214),
                      maxLength: 30,
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                              left: 12, right: 12, top: 6, bottom: 6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          counterText: "",
                          counterStyle:
                              const TextStyle(color: Colors.transparent),
                          hintText: "Password",
                          hintStyle: AppFonts.w500dark214),
                      obscureText: true,
                      maxLength: 30,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    PrimaryButton(
                        title: "Login",
                        function: () {
                          AuthService().login(
                              email: email,
                              password: password,
                              context: context);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const HomeScreen(),
                          //     ));
                        },
                        borderColor: const Color(0xff45C08D),
                        backgroundColor: const Color(0xff45C08D),
                        textStyle: AppFonts.w500white14)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
