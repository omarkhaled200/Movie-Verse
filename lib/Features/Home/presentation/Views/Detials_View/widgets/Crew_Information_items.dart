import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/Core/utlis/assets.dart';
import 'package:movie_verse/Features/Home/presentation/View_Model/Detials_View_View_modal/Get%20Crew%20Movie%20Cubit/get_crew_movie_cubit.dart';

class CrewInformationItem extends StatelessWidget {
  const CrewInformationItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return BlocBuilder<GetCrewMovieCubit, GetCrewMovieState>(
      builder: (context, state) {
        if (state is GetCrewMovieSuccess) {
          return SizedBox(
            height: height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.crew.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: height * 0.2,
                  child: Center(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.black54,
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${state.crew[index].profilePath}",
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.5,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color: Colors.grey[900],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.crew[index].originalName!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                state.crew[index].job!,
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
