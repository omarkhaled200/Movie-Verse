import 'package:flutter/material.dart';

class SearchMovieRating extends StatelessWidget {
  const SearchMovieRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.star_rate_rounded, color: Colors.amber, size: 18),
        SizedBox(width: 2),
        Text(
          "7.5 / 10",
          style: TextStyle(color: Colors.amber[200], fontSize: 16),
        ),
        SizedBox(width: 5),
        Text(
          'IMDB Rating',
          style: TextStyle(fontSize: 14, color: Colors.blueGrey),
        ),
      ],
    );
  }
}
