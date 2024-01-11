import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_aplikasi/beranda/subs.dart';
import 'package:tugas_aplikasi/komponen/pageAll.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<String> items = [
    "Movies",
    "Subscription",
  ];

  static List<Widget> _menu = [PageAll(), Subs()];

  int current = 0;

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
            Image.asset(
              "assets/image/logo.jpg",
              height: 30, // Sesuaikan tinggi gambar sesuai kebutuhan
            ),
            const Icon(
              Icons.connected_tv_outlined,
              color: Colors.blue,
              size: 35,
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.only(
                                  left: 18, right: 15, bottom: 5),
                              width: 100,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: current == index
                                      ? Colors.grey.shade100
                                      : Colors.black,
                                  borderRadius: current == index
                                      ? BorderRadius.circular(20)
                                      : BorderRadius.circular(10),
                                  border: current == index
                                      ? Border.all(color: Colors.blue, width: 3)
                                      : null),
                              child: Center(
                                child: Text(
                                  items[index],
                                  style: GoogleFonts.laila(
                                      fontWeight: FontWeight.bold,
                                      color: current == index
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: current == index,
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              _menu.elementAt(current),
            ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(const MyHome());
// }
