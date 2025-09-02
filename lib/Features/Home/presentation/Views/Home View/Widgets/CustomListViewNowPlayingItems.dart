import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_verse/Core/utlis/App_Router.dart';
import 'package:movie_verse/Features/Home/presentation/View_Model/Home_View_View_modal/Get%20Now%20Playing%20Movie/get_now_playing_movie_cubit.dart';

import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/StarRating.dart';

class CustomListViewNowPlayingItems extends StatelessWidget {
  const CustomListViewNowPlayingItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNowPlayingMovieCubit, GetNowPlayingMovieState>(
      builder: (context, state) {
        if (state is GetNowPlayingMovieSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
            child: ListView.builder(
              itemCount: state.movie.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).push(AppRouter.detialsview, extra: state.movie[index].id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500${state.movie[index].posterPath}",
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.25,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            state.movie[index].title!,
                            style: TextStyle(fontSize: 18),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 10),
                        StarRating(rating: state.movie[index].voteAverage!),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is GetNowPlayingMovieFailure) {
          return const Center(child: Text("Failed to load data"));
        } else {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: CircularProgressIndicator(color: Color(0xff3b82f6)),
          );
        }
      },
    );
  }
}
