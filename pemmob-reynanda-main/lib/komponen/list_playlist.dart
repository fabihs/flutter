import 'package:flutter/material.dart';

class MyPlaylist extends StatelessWidget {
  const MyPlaylist(
      {super.key, required this.ply, required this.ikon, required this.tks});

  final String ply;
  final IconData ikon;
  final String tks;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.only(right: 7),
      height: 200.0,
      width: 330.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xff111111),
        image: DecorationImage(
            image: AssetImage(ply), fit: BoxFit.cover, opacity: 0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            ikon,
            color: Colors.white,
            size: 50,
          ),
          Text(
            tks,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
