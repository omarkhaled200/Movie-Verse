import 'package:flutter/material.dart';
import 'package:movie_verse/Core/utlis/assets.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/CustomCarouselSlider.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/CustomTopicNameItem.dart';

class CustomScrollViewHomeView extends StatelessWidget {
  const CustomScrollViewHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [CustomCarouselSlider(), SizedBox(height: 20)],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomTopicNameItem(
                titlename: "Trending Movies",
                imageurl: Assets.titanic,
                filmname: "Titanic",
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomTopicNameItem(
                titlename: "Now Playing",
                imageurl: Assets.loginimage,
                filmname: "Titanic",
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomTopicNameItem(
                titlename: "Top Rated",
                imageurl: Assets.registerimage,
                filmname: "Titanic",
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomTopicNameItem(
                titlename: "Upcoming",
                imageurl: Assets.rata,
                filmname: "Ratatouille",
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
