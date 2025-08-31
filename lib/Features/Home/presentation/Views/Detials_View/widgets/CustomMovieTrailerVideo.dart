import 'package:flutter/material.dart';

class CustomMovieTrailerVideo extends StatelessWidget {
  const CustomMovieTrailerVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.amber.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.amber, width: 2),
        ),
        child: Row(
          children: [
            Icon(Icons.play_arrow, color: Colors.white, size: 26),
            Text(
              'Trailer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
