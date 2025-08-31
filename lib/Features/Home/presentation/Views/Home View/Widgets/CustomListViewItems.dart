import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_verse/Core/utlis/App_Router.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/StarRating.dart';

class CustomListViewItems extends StatelessWidget {
  const CustomListViewItems({
    super.key,
    required this.imageurl,
    required this.filmname,
  });

  final String imageurl;
  final String filmname;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      child: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.detialsview);
            },
            child: Padding(
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
                  SizedBox(height: 10),
                  StarRating(rating: 7),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
