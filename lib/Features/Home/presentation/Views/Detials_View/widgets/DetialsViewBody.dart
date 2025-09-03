import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/Core/utlis/api_class.dart';
import 'package:movie_verse/Core/utlis/custom_Container_image.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Detials%20Repos/Detials_Repo_impl.dart';
import 'package:movie_verse/Features/Home/presentation/View_Model/Detials_View_View_modal/Get%20Cast%20Movie%20Cubit/get_cast_movie_cubit.dart';
import 'package:movie_verse/Features/Home/presentation/View_Model/Detials_View_View_modal/Get%20Crew%20Movie%20Cubit/get_crew_movie_cubit.dart';
import 'package:movie_verse/Features/Home/presentation/View_Model/Detials_View_View_modal/Get%20Detial%20Movie%20View/get_detial_movie_view_cubit.dart';
import 'package:movie_verse/Features/Home/presentation/View_Model/Detials_View_View_modal/Get%20Similar%20Moive%20cubit/get_similar_moive_cubit.dart';
import 'package:movie_verse/Features/Home/presentation/View_Model/Detials_View_View_modal/Get%20Trailar%20Moive%20Cubit/get_trailar_moive_cubit.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/Cast_Information_items.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/Crew_Information_items.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomArrowback.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomFilmInfoRow.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomFilmNameDesign.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/CustomFilmTypewidget.dart';
import 'package:movie_verse/Features/Home/presentation/Views/Detials_View/widgets/Simillar_Film_Section.dart';

class DetialsViewBody extends StatelessWidget {
  const DetialsViewBody({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<GetDetialMovieViewCubit, GetDetialMovieViewState>(
          builder: (context, state) {
            if (state is GetDetialMovieViewSuccess) {
              int runtime = state.movie.runtime!;
              int hours = runtime ~/ 60;
              int minutes = runtime % 60;

              String duration = "${hours}h ${minutes}m";

              return Stack(
                children: [
                  customcontainerimage(
                    height: height,
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500${state.movie.posterPath}",
                    ),
                  ),

                  Container(
                    height: height * 0.6,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54],
                      ),
                    ),
                  ),

                  const Positioned(top: 15, left: 15, child: CustomArrowback()),

                  DraggableScrollableSheet(
                    initialChildSize: 0.55,
                    minChildSize: 0.55,
                    maxChildSize: 0.95,
                    builder: (context, controller) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.50),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: ListView(
                          controller: controller,
                          padding: const EdgeInsets.all(16),
                          children: [
                            CustomFilmNameDesign(
                              width: width,
                              height: height,
                              filmname: '${state.movie.title}',
                            ),
                            const SizedBox(height: 10),

                            CustomFilmTypewidget(
                              genremodal: state.movie.genres!,
                            ),

                            const SizedBox(height: 20),

                            BlocProvider(
                              create: (context) => GetTrailarMoiveCubit(
                                DetialsRepoImpl(ApiClass(Dio())),
                              )..getTrailarMovie(id: id),
                              child: CustomFilmInfoRow(
                                rate: "${state.movie.voteAverage}",
                                duration: duration,
                              ),
                            ),

                            const SizedBox(height: 16),

                            Text(
                              state.movie.overview ?? '',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                height: 1.4,
                              ),
                            ),

                            const SizedBox(height: 24),

                            const Text(
                              'Cast',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            BlocProvider(
                              create: (context) => GetCastMovieCubit(
                                DetialsRepoImpl(ApiClass(Dio())),
                              )..getCastMovie(id: id),
                              child: const CastInformationItem(),
                            ),
                            const Text(
                              'Crew',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            BlocProvider(
                              create: (context) => GetCrewMovieCubit(
                                DetialsRepoImpl(ApiClass(Dio())),
                              )..getCrewMoive(id: id),
                              child: const CrewInformationItem(),
                            ),

                            const SizedBox(height: 24),

                            BlocProvider(
                              create: (context) => GetSimilarMoiveCubit(
                                DetialsRepoImpl(ApiClass(Dio())),
                              )..GetSimilarMoive(id: id),
                              child: const SimillarFilmSection(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            } else if (state is GetDetialMovieViewFailure) {
              return const Center(child: Text("Failed to load data"));
            } else {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xff3b82f6)),
              );
            }
          },
        ),
      ),
    );
  }
}
