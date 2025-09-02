import 'package:flutter/material.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/detials/genre.model.dart';

class CustomFilmTypewidget extends StatelessWidget {
  const CustomFilmTypewidget({super.key, required this.genremodal});

  final List<Genre> genremodal;

  @override
  Widget build(BuildContext context) {
    final countnum = 3;

    return SizedBox(
      height: 30,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: countnum,
          itemBuilder: (context, index) {
            return Row(
              children: [
                const Text("MyStery", style: TextStyle(color: Colors.white)),
                const SizedBox(width: 5),
                if (index != countnum - 1)
                  const Icon(Icons.circle, color: Colors.amberAccent, size: 8),
                const SizedBox(width: 5),
              ],
            );
          },
        ),
      ),
    );
  }
}
