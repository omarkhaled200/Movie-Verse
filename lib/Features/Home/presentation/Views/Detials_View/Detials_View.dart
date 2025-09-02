import 'package:flutter/material.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/trendingmodal.dart';

import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/DetialsViewBody.dart';

class DetialsView extends StatelessWidget {
  const DetialsView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return DetialsViewBody(id: id);
  }
}
