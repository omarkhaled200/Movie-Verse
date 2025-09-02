import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/Core/utlis/api_class.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Home%20Repo/Home_Repo_impl.dart';
import 'package:movie_verse/Features/Home/presentation/View_Model/Home_View_View_modal/Get%20Trending%20Movie%20Cubit/get_trending_movie_cubit.dart';

import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/CustomListViewNowPlayingItems.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/CustomListViewTrendingItems.dart';

class CustomTopicNameTrendingItem extends StatelessWidget {
  const CustomTopicNameTrendingItem({super.key, required this.titlename});

  final String titlename;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titlename,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),

            TextButton(
              onPressed: () {},
              child: Text(
                'View all',
                style: TextStyle(fontSize: 20, color: Color(0xff3b82f6)),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        BlocProvider(
          create: (context) =>
              GetTrendingMovieCubit(HomeRepoImpl(ApiClass(Dio())))
                ..gettrendingmovie(),
          child: CustomListViewTrendingItems(),
        ),
      ],
    );
  }
}
