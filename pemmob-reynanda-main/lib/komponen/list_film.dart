import 'package:flutter/material.dart';

class MyMovieList extends StatelessWidget {
  const MyMovieList({super.key, required this.gmb, required this.target});

  final String gmb;
  final Widget target;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => target,
            ));
      },
      child: SingleChildScrollView(
        scrollDirection: axisDirectionToAxis(AxisDirection.right),
        child: SizedBox(
          height: 300,
          width: 420,
          child: Image(
            image: AssetImage(gmb),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
