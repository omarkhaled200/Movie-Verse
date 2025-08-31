import 'package:flutter/material.dart';
import 'package:movie_verse/Core/utlis/assets.dart';

class CustomRowloginbygmailorapple extends StatelessWidget {
  const CustomRowloginbygmailorapple({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(Assets.google, width: 18),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(Assets.apple, width: 22),
        ),
      ],
    );
  }
}
