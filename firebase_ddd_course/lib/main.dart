import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ddd_course/injection.dart';
import 'package:firebase_ddd_course/presentation/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
