import 'package:flutter/material.dart';

import 'package:movie_verse/Features/Home/presentation/Views/Home%20View/Widgets/CustomListViewItems.dart';

class CustomTopicNameItem extends StatelessWidget {
  const CustomTopicNameItem({
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

            TextButton(
              onPressed: () {},
              child: Text(
                'View all',
                style: TextStyle(fontSize: 20, color: Color(0xff3b82f6)),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        CustomListViewItems(imageurl: imageurl, filmname: filmname),
      ],
    );
  }
}
