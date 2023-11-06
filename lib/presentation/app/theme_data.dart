import 'package:bab_alomda_assessment_flutter/entrypoint/environment.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:google_fonts/google_fonts.dart';

final themeData = ThemeData(
  useMaterial3: true,
  textTheme: isTestingEnv() ? null : GoogleFonts.openSansTextTheme(),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueGrey,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: SharedAxisPageTransitionsBuilder(
        transitionType: SharedAxisTransitionType.vertical,
      ),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);
