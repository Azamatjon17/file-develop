import 'package:flutter/material.dart';

class FilledButtonWidget extends StatelessWidget {
  const FilledButtonWidget({
    super.key,
    required this.text,
    required this.function,
    required this.isActive,
  });

  final String text;
  final VoidCallback function;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isActive ? function : null,
      style: FilledButton.styleFrom(
        backgroundColor: isActive ? Colors.blue : Colors.grey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
