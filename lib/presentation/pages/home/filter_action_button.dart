import 'package:flutter/material.dart';

class FilterActionButton extends StatefulWidget {
  static Key removeKey = const Key("REMOVE");

  final List<String> options;
  final void Function(String? value) onValueSelected;

  const FilterActionButton({
    super.key,
    required this.options,
    required this.onValueSelected,
  });

  @override
  State<FilterActionButton> createState() => _FilterActionButtonState();
}

class _FilterActionButtonState extends State<FilterActionButton> {
  String? selectedFilter;

  void selectFilter(String? filter) {
    setState(() {
      selectedFilter = filter;
      widget.onValueSelected(filter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String?>(
      constraints: const BoxConstraints.expand(width: 150, height: 325),
      icon: selectedFilter == null
          ? const Icon(Icons.filter_alt_outlined)
          : const Icon(Icons.filter_alt),
      itemBuilder: (BuildContext context) {
        return <String?>[
          if (selectedFilter != null) null,
          ...widget.options,
        ]
            .map(
              (e) => PopupMenuItem<String?>(
                key: e == null ? FilterActionButton.removeKey : null,
                onTap: () {
                  if (selectedFilter != e) {
                    selectFilter(e);
                  }
                },
                child: Container(
                  color:
                      e != null && e == selectedFilter ? Colors.black12 : null,
                  child: Text(
                    e ?? "Remove filter",
                    style: TextStyle(color: e == null ? Colors.red : null),
                  ),
                ),
              ),
            )
            .toList();
      },
    );
  }
}
