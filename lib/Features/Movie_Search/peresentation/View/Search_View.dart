import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/Core/utlis/api_class.dart';
import 'package:movie_verse/Features/Movie_Search/data/Search%20Repo/Search_Repo_impl.dart';
import 'package:movie_verse/Features/Movie_Search/peresentation/View/widgets/Search_View_Body.dart';
import 'package:movie_verse/Features/Movie_Search/peresentation/View_model/Get%20Movie%20search/get_movie_search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMovieSearchCubit(SearchRepoImpl(ApiClass(Dio()))),
      child: const SafeArea(child: Scaffold(body: SearchViewBody())),
    );
  }
}
