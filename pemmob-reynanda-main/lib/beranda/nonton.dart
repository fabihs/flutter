import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Nonton extends StatefulWidget {
  const Nonton({
    Key? key,
    required this.pict,
    required String title,
    required this.judul,
    required this.desc,
    required this.video,
  }) : super(key: key);

  final String pict;
  final String judul;
  final String desc;
  final String video;

  @override
  _NontonState createState() => _NontonState();
}

class _NontonState extends State<Nonton> {
  bool isPlaying = false;

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  final db = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser?.uid;
  bool isPayment = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.video));
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ambil deskripsi awal sebanyak 100 karakter
    String shortDesc = widget.desc.substring(0, 100);
    FirebaseStorage storageRef = FirebaseStorage.instance;
    storageRef
        .ref('Wreck-It Ralph.mp4')
        .getDownloadURL()
        .then((url) => {print(url)});

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CashFlix",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                Positioned.fill(
                  child: IconButton(
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 64.0,
                    ),
                    onPressed: () {
                      if (isPayment) {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            // Informasi film atau konten lainnya
            Text(widget.judul,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            // Tambahkan deskripsi film dalam tabel dan tombol "Lihat Selengkapnya"
            Table(
              columnWidths: {
                1: FlexColumnWidth(),
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 35, left: 30, right: 30, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Menggunakan widget Container untuk membatasi lebar deskripsi
                          Container(
                            child: Text(
                              shortDesc,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(widget.judul),
                                  content: Text(widget.desc),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text("See more..."),
                          ),
                          SizedBox(height: 8),
                          StreamBuilder(
                              stream: db
                                  .collection("userData")
                                  .doc(uid)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                var data = snapshot.data;
                                return ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Success payment'),
                                        content: Text('Enjoy the film'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              int coins = data?['coins'];
                                              db
                                                  .collection("userData")
                                                  .doc(uid)
                                                  .set({
                                                "coins": coins - 30,
                                              }, SetOptions(merge: true));
                                              setState(() {
                                                isPayment = true;
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text("Pay 30 coin"),
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                SizedBox(width: 8.0),
                Text("Rating: 4.5",
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
