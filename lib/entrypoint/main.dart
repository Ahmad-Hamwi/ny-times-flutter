import 'package:ny_times_flutter/di/di_container.dart';
import 'package:ny_times_flutter/presentation/app/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDiContainer();
  runApp(MyMaterialApp());
}
