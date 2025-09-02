import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRating extends StatelessWidget {
  const StarRating({super.key, required this.rating});

  final double rating;
  @override
  Widget build(BuildContext context) {
    double fiveStarRating = rating / 2;

    return RatingBarIndicator(
      rating: fiveStarRating,
      itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
      itemCount: 5,
      itemSize: 18.0,
      direction: Axis.horizontal,
    );
  }
}
