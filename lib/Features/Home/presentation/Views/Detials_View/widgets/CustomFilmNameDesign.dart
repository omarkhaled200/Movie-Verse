import 'package:flutter/material.dart';

class CustomFilmNameDesign extends StatelessWidget {
  const CustomFilmNameDesign({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 32.0,
            color: Colors.black,
          ),
        ],
      ),
      width: width,
      height: height * 0.1,
      child: Center(
        child: Text(
          'Rata',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 16.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
