import 'package:flutter/material.dart';

class CustomDisplayfilmRate extends StatelessWidget {
  const CustomDisplayfilmRate({super.key, required this.rate});
  final String rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star_rate_rounded, color: Colors.amber, size: 36),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'IMDB Rating',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Text(
              "${double.parse(rate).toStringAsFixed(1)} / 10",
              style: TextStyle(color: Colors.amber, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
