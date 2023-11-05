import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  static Key closeKey = const Key("CLOSE");

  final void Function(String submittedQuery) onQuerySubmitted;

  const SearchTextField({super.key, required this.onQuerySubmitted});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final TextEditingController queryController;
  late final FocusNode focusNode;
  late bool isTextEmpty = true;

  @override
  void initState() {
    setupQueryController();
    focusNode = FocusNode();
    super.initState();
  }

  void setupQueryController() {
    queryController = TextEditingController(text: "")
      ..addListener(() {
        final queryControllerTextIsEmpty = queryController.text == "";
        if (isTextEmpty != queryControllerTextIsEmpty) {
          setState(() => isTextEmpty = queryControllerTextIsEmpty);
        }
      });
  }

  void clearText() {
    queryController.text = "";
    widget.onQuerySubmitted("");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focusNode);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: <Widget>[
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8.0),
            Expanded(
              child: TextField(
                focusNode: focusNode,
                controller: queryController,
                textInputAction: TextInputAction.done,
                onSubmitted: widget.onQuerySubmitted,
                decoration: const InputDecoration.collapsed(hintText: "Search"),
                maxLines: 1,
              ),
            ),
            if (!isTextEmpty)
              GestureDetector(
                onTap: clearText,
                child: Icon(
                  key: SearchTextField.closeKey,
                  Icons.close,
                  color: Colors.grey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
