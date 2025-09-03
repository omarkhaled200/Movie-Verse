import 'package:flutter/material.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/detials/genre.model.dart';

class CustomFilmTypewidget extends StatelessWidget {
  const CustomFilmTypewidget({super.key, required this.genremodal});

  final List<Genre> genremodal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: genremodal.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text(
                  "${genremodal[index].name}",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 5),
                if (index != genremodal.length - 1)
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
