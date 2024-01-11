import 'package:flutter/material.dart';

class MyDetail extends StatelessWidget {
  const MyDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Isi halaman detail movie",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
