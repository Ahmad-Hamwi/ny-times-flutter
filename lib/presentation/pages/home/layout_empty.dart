import 'package:flutter/material.dart';

class LayoutEmpty extends StatelessWidget {
  const LayoutEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No results, try with another filter"),
    );
  }
}
