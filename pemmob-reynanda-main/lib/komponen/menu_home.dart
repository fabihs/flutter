import 'package:flutter/material.dart';

class MyHomeMenu extends StatelessWidget {
  const MyHomeMenu({
    super.key,
    required this.title,
    required this.color,
    required this.bgColor,
    required this.onPressed,
  });

  final String title;
  final Color color, bgColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: TextStyle(color: color, fontSize: 20),
        ),
      ),
    );
  }
}
