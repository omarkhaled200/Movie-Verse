import 'package:flutter/material.dart';

import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/CustomAppBar.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/CustomScrollViewHomeView.dart';

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
