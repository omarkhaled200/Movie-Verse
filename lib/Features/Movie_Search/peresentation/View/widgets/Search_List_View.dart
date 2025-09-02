import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/Features/Movie_Search/peresentation/View/widgets/Search_Movie_item.dart';
import 'package:movie_verse/Features/Movie_Search/peresentation/View_model/Get%20Movie%20search/get_movie_search_cubit.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMovieSearchCubit, GetMovieSearchState>(
      builder: (context, state) {
        if (state is GetMovieSearchSucces) {
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: state.movie.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: MovieListViewItem(movie: state.movie[index]),
              );
            },
          );
        } else if (state is GetMovieSearchFailure) {
          return const Center(child: Text("Failed to load data"));
        } else {
          return Center(
            child: SizedBox(
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: CircularProgressIndicator(color: Color(0xff3b82f6)),
              ),
            ),
          );
        }
      },
    );
  }
}
