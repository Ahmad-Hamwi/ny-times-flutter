import 'package:bab_alomda_assessment_flutter/presentation/pages/home/search_text_field.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/section_filter_button.dart';
import 'package:bab_alomda_assessment_flutter/presentation/pages/home/toggle_list_view.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final void Function(String submittedQuery) onQuerySubmitted;

  const HomeAppBar({super.key, required this.onQuerySubmitted});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 12,
      title: SearchTextField(
        onQuerySubmitted: onQuerySubmitted,
      ),
    );
  }
}
