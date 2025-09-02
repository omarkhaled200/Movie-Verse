import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_verse/Core/utlis/App_Router.dart';
import 'package:movie_verse/Core/utlis/assets.dart';
import 'package:movie_verse/Features/Home/presentation/View_Model/Detials_View_View_modal/Get%20Similar%20Moive%20cubit/get_similar_moive_cubit.dart';

class SimilarFilmListView extends StatelessWidget {
  const SimilarFilmListView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<GetSimilarMoiveCubit, GetSimilarMoiveState>(
      builder: (context, state) {
        if (state is GetSimilarMoiveSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.movie.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.detialsview,
                        extra: state.movie[index].id,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: width * 0.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${state.movie[index].posterPath}",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is GetSimilarMoiveFailure) {
          return const Center(child: Text("Failed to load data"));
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xff3b82f6)),
          );
        }
      },
    );
  }
}
