import 'package:flutter/material.dart';

class CustomAlert extends StatefulWidget {
  Widget content;
  String buttonText;
  CustomAlert({super.key, required this.content, required this.buttonText});

  @override
  State<CustomAlert> createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AlertDialog(
      backgroundColor: colorScheme.background,
      content: widget.content,
      actions: [
        TextButton(
          onPressed: null,
          child: Text(
            widget.buttonText,
            style: TextStyle(color: colorScheme.secondary),
          ),
        )
      ],
    );
  }
}
