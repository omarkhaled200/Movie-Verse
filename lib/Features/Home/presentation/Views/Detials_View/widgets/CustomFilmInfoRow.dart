import 'package:flutter/material.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomDisplayfilmDuration.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomDisplayfilmRate.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomMovieTrailerVideo.dart';

class CustomFilmInfoRow extends StatelessWidget {
  const CustomFilmInfoRow({
    super.key,
    required this.rate,
    required this.duration,
  });
  final String rate;
  final String duration;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDisplayfilmRate(rate: rate),
            SizedBox(height: 5),
            CustomDisplayfilmDuration(duration: duration),
          ],
        ),
        CustomMovieTrailerVideo(
          youtubeUrl: 'https://www.youtube.com/embed/f8vm3koMd3A',
        ),
      ],
    );
  }
}
