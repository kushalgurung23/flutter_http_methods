import 'package:flutter/material.dart';

class RestButtons extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  const RestButtons({Key? key, required this.text, required this.color, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
              Radius.circular(10.0)),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
