import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomMovieImageitem extends StatelessWidget {
  const CustomMovieImageitem({super.key, required this.imageurl});
  final String imageurl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageurl,
          errorWidget: (context, url, error) => const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline_outlined),
              Text(
                'No Data Found',
                // style: Styles.textStyle14,textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
