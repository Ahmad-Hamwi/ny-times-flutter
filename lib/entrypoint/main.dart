import 'package:bab_alomda_assessment_flutter/di/di_container.dart';
import 'package:bab_alomda_assessment_flutter/presentation/app/app.dart';
import 'package:flutter/material.dart';

void main() async {
  initDiContainer();
  runApp(MyMaterialApp());
}
