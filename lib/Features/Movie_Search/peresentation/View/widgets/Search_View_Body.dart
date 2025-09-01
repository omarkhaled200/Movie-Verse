import 'package:flutter/material.dart';
import 'package:movie_verse/Features/Movie_Search/peresentation/View/widgets/Custom_Search_View_Text_Field.dart';
import 'package:movie_verse/Features/Movie_Search/peresentation/View/widgets/Search_List_View.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          CustomSearchViewTextField(),
          const SizedBox(height: 16),
          const Text(
            'Search Now',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          const Expanded(child: SearchListView()),
        ],
      ),
    );
  }
}
