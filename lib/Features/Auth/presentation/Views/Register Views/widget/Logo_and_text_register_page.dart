import 'package:flutter/material.dart';
import 'package:movie_verse/Core/utlis/assets.dart';

class Logoandtextregisterpage extends StatelessWidget {
  const Logoandtextregisterpage({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(Assets.logo5, width: width),
        Positioned(
          bottom: 10,
          child: Text(
            "Create Your Account",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
