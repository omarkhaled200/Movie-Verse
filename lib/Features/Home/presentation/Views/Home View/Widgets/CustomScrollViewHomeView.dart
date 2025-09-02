import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/Core/utlis/api_class.dart';
import 'package:movie_verse/Core/utlis/assets.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Home%20Repo/Home_Repo_impl.dart';
import 'package:movie_verse/Features/Home/presentation/View_Model/Home_View_View_modal/Get%20Popular%20Movie/get_popular_movie_cubit.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/CustomCarouselSlider.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/CustomTopicNameNowPlayingItem.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/CustomTopicNameTopRatedItem.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/CustomTopicNameTrendingItem.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/CustomTopicNameUpcomingItem.dart';

class CustomScrollViewHomeView extends StatelessWidget {
  const CustomScrollViewHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              BlocProvider(
                create: (context) =>
                    GetPopularMovieCubit(HomeRepoImpl(ApiClass(Dio())))
                      ..getPopularMovie(),
                child: CustomCarouselSlider(),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomTopicNameTrendingItem(titlename: "Trending Movies"),
              SizedBox(height: 10),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomTopicNameNowPlayingItem(titlename: "Now Playing"),
              SizedBox(height: 10),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomTopicNameTopRatedItem(titlename: "Top Rated"),
              SizedBox(height: 10),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomTopicNameUpcomingItem(titlename: "Upcoming"),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
