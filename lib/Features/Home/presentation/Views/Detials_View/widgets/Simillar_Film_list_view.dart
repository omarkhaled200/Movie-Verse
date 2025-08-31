import 'package:flutter/material.dart';
import 'package:movie_verse/Core/utlis/assets.dart';

class SimilarFilmListView extends StatelessWidget {
  const SimilarFilmListView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: width * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Image.asset(Assets.titanic, fit: BoxFit.fill),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
