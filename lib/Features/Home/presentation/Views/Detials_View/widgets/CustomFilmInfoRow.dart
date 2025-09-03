import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/Features/Home/presentation/View_Model/Detials_View_View_modal/Get%20Trailar%20Moive%20Cubit/get_trailar_moive_cubit.dart';
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
        BlocBuilder<GetTrailarMoiveCubit, GetTrailarMoiveState>(
          builder: (context, state) {
            if (state is GetTrailarMoiveSuccess) {
              return CustomMovieTrailerVideo(
                youtubeUrl: 'https://www.youtube.com/embed/${state.movie.key}',
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ],
    );
  }
}
