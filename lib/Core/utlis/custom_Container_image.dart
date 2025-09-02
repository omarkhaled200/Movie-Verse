// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class customcontainerimage extends StatelessWidget {
  const customcontainerimage({
    Key? key,
    required this.height,
    required this.image,
  }) : super(key: key);

  final double height;
  final ImageProvider<Object> image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.6,
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.fill),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    );
  }
}
