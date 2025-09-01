import 'package:flutter/material.dart';

import 'package:movie_verse/Core/utlis/assets.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomDisplayfilmRate.dart';
import 'package:movie_verse/Features/Movie_Search/peresentation/View/widgets/Custom_movie_image_item.dart';
import 'package:movie_verse/Features/Movie_Search/peresentation/View/widgets/SearchMovieRating.dart';

class MovieListViewItem extends StatelessWidget {
  const MovieListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        // GoRouter.of(context).push(AppRouters.kBookDitailsview,extra: bookModel);
      },
      child: Row(
        children: [
          SizedBox(
            height: height * 0.2,
            child: CustomMovieImageitem(imageurl: Assets.titanic),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    'Titanic',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                  "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                SearchMovieRating(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
