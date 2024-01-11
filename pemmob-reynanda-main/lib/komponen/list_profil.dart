import 'package:flutter/material.dart';

class MyList_Profil extends StatelessWidget {
  const MyList_Profil({super.key, required this.ttl, required this.ikn});

  final String ttl;
  final IconData ikn;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: Row(
        children: [
          Icon(ikn),
          const SizedBox(
            width: 3,
          ),
          Text(ttl),
        ],
      ),
    );
  }
}
