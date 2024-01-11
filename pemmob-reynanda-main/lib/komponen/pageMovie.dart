import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Ini adalah isi halaman movie",
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ),
        ],
      ),
    );
  }
}
