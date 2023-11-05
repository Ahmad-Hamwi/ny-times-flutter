import 'package:flutter/material.dart';

class ToggleListActionButton extends StatefulWidget {
  static Key gridKey = const Key("GRID");
  static Key listKey = const Key("LIST");

  final Function(bool isListView) onToggled;

  const ToggleListActionButton({super.key, required this.onToggled});

  @override
  State<ToggleListActionButton> createState() => _ToggleListActionButtonState();
}

class _ToggleListActionButtonState extends State<ToggleListActionButton> {
  late bool isListView;

  @override
  void initState() {
    isListView = true;
    super.initState();
  }

  void toggle() {
    setState(() {
      isListView = !isListView;

      widget.onToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isListView
        ? IconButton(
            key: ToggleListActionButton.gridKey,
            icon: const Icon(Icons.grid_view),
            onPressed: toggle,
          )
        : IconButton(
            key: ToggleListActionButton.listKey,
            icon: const Icon(Icons.view_agenda_outlined),
            onPressed: toggle,
          );
  }
}
