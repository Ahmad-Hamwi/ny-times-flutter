import 'package:flutter/material.dart';

class ToggleListActionButton extends StatelessWidget {
  static Key gridKey = const Key("GRID");
  static Key listKey = const Key("LIST");

  final bool isListView;
  final VoidCallback onToggled;

  const ToggleListActionButton({
    super.key,
    required this.isListView,
    required this.onToggled,
  });

  @override
  Widget build(BuildContext context) {
    return isListView
        ? IconButton(
            key: ToggleListActionButton.gridKey,
            icon: const Icon(Icons.grid_view),
            onPressed: onToggled,
          )
        : IconButton(
            key: ToggleListActionButton.listKey,
            icon: const Icon(Icons.view_agenda_outlined),
            onPressed: onToggled,
          );
  }
}
