import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Subs extends StatefulWidget {
  const Subs({Key? key});

  @override
  _SubsState createState() => _SubsState();
}

class _SubsState extends State<Subs> {
  final db = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/image/trans.png',
                    fit: BoxFit.cover,
                  ),
                ),
                StreamBuilder(
                    stream: db.collection("userData").doc(uid).snapshots(),
                    builder: (context, snapshot) {
                      var data = snapshot.data;
                      return Text(
                        "Your coins: ${data?['coins'] ?? ''}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      );
                    }),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Top up coins:",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            buildTopUpMenu(100, 49000, 'assets/image/topup1.jpg'),
            buildTopUpMenu(300, 129000, 'assets/image/topup2.jpg'),
            buildTopUpMenu(500, 200000, 'assets/image/topup3.jpg'),
            const SizedBox(height: 20),
            const Text(
              "Subscription:",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            buildSubscriptionItem("30 days", 20, 'assets/image/sub1.jpg'),
            buildSubscriptionItem("3 months", 50, 'assets/image/sub2.jpg'),
            buildSubscriptionItem("1 year", 90, 'assets/image/sub3.jpg'),
          ],
        ),
      ),
    );
  }

  Widget buildTopUpMenu(int points, int price, String imagePath) {
    return Card(
      elevation: 3,
      color: Colors.grey[900],
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 50,
            fit: BoxFit.cover,
          ),
          StreamBuilder(
              stream: db.collection("userData").doc(uid).snapshots(),
              builder: (context, snapshot) {
                var data = snapshot.data;
                return ListTile(
                  title: Text('$points coins',
                      style: TextStyle(color: Colors.white)),
                  subtitle:
                      Text('Rp $price', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Confirm Top Up',
                            style: TextStyle(color: Colors.white)),
                        content: Text(
                            'Top up $points coins for Rp $price. Continue?',
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.grey[850],
                        actions: [
                          TextButton(
                            onPressed: () {
                              int coins = data?['coins'];
                              db.collection("userData").doc(uid).set({
                                "coins": coins + points,
                              }, SetOptions(merge: true));
                              Navigator.pop(context);
                            },
                            child: const Text('OK',
                                style: TextStyle(color: Colors.white)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
        ],
      ),
    );
  }

  Widget buildSubscriptionItem(String duration, int price, String imagePath) {
    return Card(
      elevation: 3,
      color: Colors.grey[900],
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 50,
            fit: BoxFit.cover,
          ),
          StreamBuilder(
              stream: db.collection("userData").doc(uid).snapshots(),
              builder: (context, snapshot) {
                var data = snapshot.data;
                return ListTile(
                  title: Text('$duration subscription',
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text('$price coins',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Confirm subscription',
                            style: TextStyle(color: Colors.white)),
                        content: Text(
                            'Subscribe for $duration with $price coins. Continue?',
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.grey[850],
                        actions: [
                          TextButton(
                            onPressed: () {
                              int coins = data?['coins'];
                              db.collection("userData").doc(uid).set({
                                "coins": coins - price,
                              }, SetOptions(merge: true));
                              Navigator.pop(context);
                            },
                            child: const Text('OK',
                                style: TextStyle(color: Colors.white)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
        ],
      ),
    );
  }
}
