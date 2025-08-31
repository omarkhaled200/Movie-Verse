import 'package:flutter/material.dart';
import 'package:movie_verse/Core/utlis/assets.dart';

import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/CustomAppBar.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/CustomCarouselSlider.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBar(),
            Expanded(child: CustomScrollViewHomeView()),
          ],
        ),
      ),
    );
  }
}

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
              CustomListViewItems(
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
              CustomListViewItems(
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
              CustomListViewItems(
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
              CustomListViewItems(
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

class CustomListViewItems extends StatelessWidget {
  const CustomListViewItems({
    super.key,
    required this.titlename,
    required this.imageurl,
    required this.filmname,
  });

  final String titlename;
  final String imageurl;
  final String filmname;
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

            GestureDetector(
              onTap: () {},
              child: Text(
                'View all',
                style: TextStyle(fontSize: 20, color: Color(0xff3b82f6)),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: ListView.builder(
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Image.asset(
                        imageurl,
                        fit: BoxFit.fill,
                        width: 150,
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(filmname, style: TextStyle(fontSize: 22)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
