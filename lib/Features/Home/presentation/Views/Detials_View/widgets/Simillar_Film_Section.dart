import 'package:flutter/material.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/Simillar_Film_list_view.dart';

class SimillarFilmSection extends StatelessWidget {
  const SimillarFilmSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Similar Film',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        SimilarFilmListView(),
        SizedBox(height: 20),
      ],
    );
  }
}
