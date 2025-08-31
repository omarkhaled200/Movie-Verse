import 'package:flutter/material.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomDisplayfilmDuration.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomDisplayfilmRate.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomMovieTrailerVideo.dart';

class CustomFilmInfoRow extends StatelessWidget {
  const CustomFilmInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDisplayfilmRate(),
            SizedBox(height: 5),
            CustomDisplayfilmDuration(),
          ],
        ),
        CustomMovieTrailerVideo(),
      ],
    );
  }
}
