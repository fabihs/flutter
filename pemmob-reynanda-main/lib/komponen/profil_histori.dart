import 'package:flutter/material.dart';

class MyHistori extends StatelessWidget {
  const MyHistori({super.key, required this.htr});

  final String htr;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.only(right: 7, top: 10),
      height: 160.0,
      width: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xff111111),
        image: DecorationImage(
          image: AssetImage(htr),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
