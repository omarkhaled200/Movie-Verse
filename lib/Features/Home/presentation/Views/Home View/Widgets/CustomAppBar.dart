import 'package:flutter/material.dart';
import 'package:movie_verse/Core/utlis/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(Assets.logo5, width: 100, height: 100, fit: BoxFit.cover),

        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search_rounded, size: 34),
        ),
      ],
    );
  }
}
