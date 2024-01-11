import 'package:flutter/material.dart';

class MyHistoriDetail extends StatelessWidget {
  final List<String> filmTitles = [
    "Waktu Maghrib",
    "Saw X",
    "Triple Threat",
    "Avatar",
    // Tambahkan judul film sesuai kebutuhan
  ];

  MyHistoriDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Watch History"),
      ),
      body: ListView.builder(
        itemCount: filmTitles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              filmTitles[index],
              style: TextStyle(color: Colors.white),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/image/film$index.jpg"),
            ),
          );
        },
      ),
    );
  }
}
