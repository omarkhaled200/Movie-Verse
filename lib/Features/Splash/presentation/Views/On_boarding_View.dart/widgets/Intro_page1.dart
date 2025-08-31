import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_verse/Core/utlis/App_Router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({
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
                  'https://lottie.host/2f9dd83f-eb59-4672-b42d-ca70816f694d/bJp4Tv5WHr.json',
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Discover the World of Movies 🎬',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: const Text(
                  'Browse trending, top-rated, and upcoming films — all in one place',
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
                        GoRouter.of(context).push(AppRouter.homeview);
                      },
                      child: Container(
                        width: 150,
                        height: 50,

                        decoration: BoxDecoration(
                          color: Color(0xff3b82f6),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: const Text(
                            'Done',
                            style: TextStyle(fontWeight: FontWeight.w500),
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
                              fontSize: 20,
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
