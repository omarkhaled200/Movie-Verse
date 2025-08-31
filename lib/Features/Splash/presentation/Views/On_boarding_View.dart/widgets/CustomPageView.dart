import 'package:flutter/material.dart';
import 'package:movie_verse/Features/Splash/presentation/Views/On_boarding_View.dart/widgets/Intro_Page2.dart';
import 'package:movie_verse/Features/Splash/presentation/Views/On_boarding_View.dart/widgets/Intro_page1.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required PageController controller,
    required this.onpagechange,
    required this.onlastpage,
  }) : _controller = controller;
  final bool onlastpage;
  final PageController _controller;
  final void Function(int)? onpagechange;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      onPageChanged: onpagechange,
      children: [
        IntroPage1(controller: _controller, onlastpage: onlastpage),
        IntroPage2(controller: _controller, onlastpage: onlastpage),
      ],
    );
  }
}
