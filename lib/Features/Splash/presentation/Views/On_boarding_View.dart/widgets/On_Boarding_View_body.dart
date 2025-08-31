import 'package:flutter/material.dart';
import 'package:movie_verse/Features/Splash/presentation/Views/On_boarding_View.dart/widgets/CustomPageView.dart';

class OnBoardingViewbody extends StatefulWidget {
  const OnBoardingViewbody({super.key});

  @override
  State<OnBoardingViewbody> createState() => _OnBoardingViewbodyState();
}

class _OnBoardingViewbodyState extends State<OnBoardingViewbody> {
  PageController _controller = PageController();
  bool onlastpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPageView(
            controller: _controller,
            onlastpage: onlastpage,
            onpagechange: (value) {
              setState(() {
                onlastpage = (value == 1);
              });
            },
          ),
        ],
      ),
    );
  }
}
