import 'package:flutter/material.dart';
import 'package:movie_verse/Features/Movie_Search/peresentation/View/widgets/Search_View_Body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: SearchViewBody()));
  }
}
