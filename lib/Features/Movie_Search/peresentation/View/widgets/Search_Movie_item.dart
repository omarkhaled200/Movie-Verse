import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_verse/Core/utlis/App_Router.dart';

import 'package:movie_verse/Features/Movie_Search/data/model/search_model.dart';
import 'package:movie_verse/Features/Movie_Search/peresentation/View/widgets/Custom_movie_image_item.dart';
import 'package:movie_verse/Features/Movie_Search/peresentation/View/widgets/SearchMovieRating.dart';

class MovieListViewItem extends StatelessWidget {
  const MovieListViewItem({super.key, required this.movie});
  final SearchModel movie;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.detialsview, extra: movie.id);
      },
      child: Row(
        children: [
          SizedBox(
            height: height * 0.2,
            child: CustomMovieImageitem(
              imageurl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    movie.title!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  "${movie.overview}",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                SearchMovieRating(rate: "${movie.voteAverage}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
