import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/Core/utlis/api_class.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Detials%20Repos/Detials_Repo_impl.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/trendingmodal.dart';
import 'package:movie_verse/Features/Home/presentation/View_Model/Detials_View_View_modal/Get%20Detial%20Movie%20View/get_detial_movie_view_cubit.dart';

import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/DetialsViewBody.dart';

class DetialsView extends StatelessWidget {
  const DetialsView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetDetialMovieViewCubit(DetialsRepoImpl(ApiClass(Dio())))
            ..getMovieDetialCubit(id: id),
      child: DetialsViewBody(id: id),
    );
  }
}
