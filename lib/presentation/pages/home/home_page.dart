import 'package:bab_alomda_assessment_flutter/presentation/pages/home/home_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(58.0),
        child: HomeAppBar(
          onQuerySubmitted: (q) {},
          onViewToggled: (isListView) {},
        ),
      ),
      body: const Center(),
    );
  }
}
