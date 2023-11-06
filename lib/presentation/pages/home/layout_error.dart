import 'package:flutter/material.dart';

class LayoutError extends StatelessWidget {
  final dynamic e;
  final void Function() onRetry;

  const LayoutError({super.key, this.e, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(e.toString(), textAlign: TextAlign.center),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
