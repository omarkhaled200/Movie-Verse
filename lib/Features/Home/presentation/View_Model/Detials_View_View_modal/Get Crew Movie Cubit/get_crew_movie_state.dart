part of 'get_crew_movie_cubit.dart';

sealed class GetCrewMovieState extends Equatable {
  const GetCrewMovieState();

  @override
  List<Object> get props => [];
}

final class GetCrewMovieInitial extends GetCrewMovieState {}

final class GetCrewMovieLoading extends GetCrewMovieState {}

final class GetCrewMovieFailure extends GetCrewMovieState {
  final String errmessage;

  GetCrewMovieFailure({required this.errmessage});
}

final class GetCrewMovieSuccess extends GetCrewMovieState {
  final List<Crew> crew;

  GetCrewMovieSuccess({required this.crew});
}
