import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_aplikasi/komponen/histori_detail.dart';
import 'package:tugas_aplikasi/komponen/list_playlist.dart';
import 'package:tugas_aplikasi/komponen/list_profil.dart';
import 'package:tugas_aplikasi/komponen/profil_histori.dart';

class MyProfil extends StatelessWidget {
  MyProfil({Key? key}) : super(key: key);
  final db = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Profile",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
            ),
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed('/');
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.blue,
                size: 35,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 7,
                ),
                const Icon(
                  Icons.account_circle_outlined,
                  size: 60,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                StreamBuilder(
                    stream: db.collection("userData").doc(uid).snapshots(),
                    builder: (context, snapshot) {
                      var data = snapshot.data;
                      return Text(
                        data?['username'] ?? '',
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
              ],
            ),
            const SingleChildScrollView(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyList_Profil(
                    ttl: "Switch Account",
                    ikn: Icons.switch_account,
                  ),
                  MyList_Profil(
                    ttl: "Google Account",
                    ikn: Icons.g_mobiledata,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "History",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    child: Text("View All"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHistoriDetail(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.grey.shade700)),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        )),
                  ),
                ],
              ),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MyHistori(htr: "assets/image/film5.jpg"),
                  MyHistori(htr: "assets/image/film6.jpg"),
                  MyHistori(htr: "assets/image/film7.jpg"),
                  MyHistori(htr: "assets/image/film8.jpg"),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 10, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Playlists",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    child: Text("View All"),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.grey.shade700)),
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        )),
                  ),
                ],
              ),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MyPlaylist(
                    ply: "assets/image/film13.png",
                    ikon: Icons.thumb_up_off_alt_sharp,
                    tks: "Liked Videos",
                  ),
                  MyPlaylist(
                    ply: "assets/image/film14.jpg",
                    ikon: Icons.timelapse_rounded,
                    tks: "Watch Later",
                  ),
                  MyPlaylist(
                    ply: "assets/image/film15.jpg",
                    ikon: Icons.playlist_play_rounded,
                    tks: "Random Playlist",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
