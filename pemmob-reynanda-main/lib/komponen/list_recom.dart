import 'package:flutter/material.dart';

class MyRecom extends StatelessWidget {
  const MyRecom({super.key, required this.recm});

  final String recm;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7, top: 10),
      height: 170.0,
      width: 290.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xff111111),
        image: DecorationImage(
          image: AssetImage(recm),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
