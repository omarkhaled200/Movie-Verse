part of 'get_upcoming_movie_cubit.dart';

sealed class GetUpcomingMovieState extends Equatable {
  const GetUpcomingMovieState();

  @override
  List<Object> get props => [];
}

final class GetUpcomingMovieInitial extends GetUpcomingMovieState {}

final class GetUpcomingMovieLoading extends GetUpcomingMovieState {}

final class GetUpcomingMovieFailure extends GetUpcomingMovieState {
  final String errmessage;

  GetUpcomingMovieFailure({required this.errmessage});
}

final class GetUpcomingMovieSuccess extends GetUpcomingMovieState {
  final List<UpcomingModal> movie;

  GetUpcomingMovieSuccess({required this.movie});
}
