import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flikcar_inspection/screens/home_screen/home_screen.dart';
import 'package:flikcar_inspection/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collection = firestore.collection('admins');
    QuerySnapshot querySnapshot =
        await collection.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      var user = querySnapshot.docs[0].data() as Map<String, dynamic>;
      if (user["password"] == password) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
        await prefs.setBool('login', true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Color(0xFF45C08D),
            content: Text("Wrong Password"),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Color(0xFF45C08D),
          content: Text("Email does not exist"),
        ),
      );
    }

    // If the loop completes without finding a matching user, the login failed
  }

  Future<Widget> chooseScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? login = prefs.getBool('login');
    if (login == true) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}
