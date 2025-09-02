import 'package:flutter/material.dart';

class CustomFilmNameDesign extends StatelessWidget {
  const CustomFilmNameDesign({
    super.key,
    required this.width,
    required this.height,
    required this.filmname,
  });

  final double width;
  final double height;
  final String filmname;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        filmname,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(offset: Offset(2, 2), blurRadius: 16.0, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
