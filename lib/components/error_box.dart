import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  String? message;
  ErrorBox({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message == null) {
      return Container();
    }

    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              'Oops! $message.',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
