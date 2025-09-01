import 'package:flutter/material.dart';
import 'package:movie_verse/Features/Movie_Search/peresentation/View/widgets/Search_Movie_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: MovieListViewItem(),
        );
      },
    );
  }
}
