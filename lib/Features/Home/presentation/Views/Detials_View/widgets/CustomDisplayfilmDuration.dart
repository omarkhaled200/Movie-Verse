import 'package:flutter/material.dart';

class CustomDisplayfilmDuration extends StatelessWidget {
  const CustomDisplayfilmDuration({super.key, required this.duration});
  final String duration;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time_filled_rounded, color: Colors.amber, size: 32),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Duration',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Text(
              "$duration",
              style: TextStyle(color: Colors.amber, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
