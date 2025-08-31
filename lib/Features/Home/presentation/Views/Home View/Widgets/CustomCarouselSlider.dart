import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_verse/Core/utlis/assets.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    final items = [1, 2, 3, 4, 5];

    return Column(
      children: [
        CarouselSlider(
          items: items.map((e) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(Assets.titanic, fit: BoxFit.fill),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: height * 0.4,
            autoPlay: true,
            autoPlayCurve: Curves.easeInOut,
            viewportFraction: 0.85,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.asMap().entries.map((entry) {
            return Container(
              width: 20,
              height: 5,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                color: _currentIndex == entry.key ? Colors.blue : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
