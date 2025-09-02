part of 'get_popular_movie_cubit.dart';

sealed class GetPopularMovieState extends Equatable {
  const GetPopularMovieState();

  @override
  List<Object> get props => [];
}

final class GetPopularMovieInitial extends GetPopularMovieState {}

final class GetPopularMovieLoading extends GetPopularMovieState {}

final class GetPopularMovieFailure extends GetPopularMovieState {
  final String errmessage;

  GetPopularMovieFailure({required this.errmessage});
}

final class GetPopularMovieSuccess extends GetPopularMovieState {
  final List<PopluarModal> movie;

  GetPopularMovieSuccess({required this.movie});
}
