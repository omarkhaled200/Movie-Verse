// import 'package:ai_assistant/Core/utlis/App_Router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_verse/Core/utlis/App_Router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({
    super.key,
    required PageController controller,
    required this.onlastpage,
  }) : _controller = controller;
  final PageController _controller;
  final bool onlastpage;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              SizedBox(
                height: height * 0.4,
                child: Lottie.network(
                  'https://lottie.host/e792a117-e4c9-4d3c-9f72-a2fbcb8aaaa2/8AmX4om0X5.json',
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Your Movie Guide ⭐',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: const Text(
                  'Get detailed info, trailers, and cast — search and find your next favorite movie.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              SmoothPageIndicator(
                effect: const ExpandingDotsEffect(
                  dotWidth: 12,
                  activeDotColor: Color(0xff3b82f6),
                ),
                controller: _controller,
                count: 2,
              ),
              SizedBox(height: height * 0.1),
              onlastpage
                  ? GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.loginpage);
                      },
                      child: Container(
                        width: width * 0.8,
                        height: height * 0.07,
                        decoration: BoxDecoration(
                          color: Color(0xff3b82f6),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: const Text(
                            'Login & Registration',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Container(
                        width: width * 0.5,
                        height: height * 0.07,
                        decoration: BoxDecoration(
                          color: Color(0xff3b82f6),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
