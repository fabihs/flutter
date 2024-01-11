import 'package:flutter/material.dart';

class MyListResume extends StatefulWidget {
  const MyListResume({super.key, required this.pict, required this.onTap});

  final String pict;
  final void Function()? onTap;

  @override
  State<MyListResume> createState() => _MyListResumeState();
}

class _MyListResumeState extends State<MyListResume> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(6),
        margin: EdgeInsets.only(right: 7),
        height: 130.0,
        width: 220.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xff111111),
          image: DecorationImage(
            image: AssetImage(widget.pict),
            fit: BoxFit.fill,
          ),
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              Icons.play_circle_rounded,
              color: Colors.white,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
