import 'package:firebase_ddd_course/presentation/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.pinkAccent,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          )
        )
      ),
    );
  }
}
