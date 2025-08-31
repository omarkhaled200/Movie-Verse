import 'package:flutter/material.dart';

class CustomFilmTypewidget extends StatelessWidget {
  const CustomFilmTypewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("MyStery", style: TextStyle(color: Colors.white)),

          SizedBox(width: 5),
          Icon(Icons.circle, color: Colors.amberAccent, size: 8),
          SizedBox(width: 5),
          const Text("Action", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
