part of 'get_top_rated_movie_cubit.dart';

sealed class GetTopRatedMovieState extends Equatable {
  const GetTopRatedMovieState();

  @override
  List<Object> get props => [];
}

final class GetTopRatedMovieInitial extends GetTopRatedMovieState {}

final class GetTopRatedMovieLoading extends GetTopRatedMovieState {}

final class GetTopRatedMovieFailure extends GetTopRatedMovieState {
  final String errmessage;

  GetTopRatedMovieFailure({required this.errmessage});
}

final class GetTopRatedMovieSuccess extends GetTopRatedMovieState {
  final List<TopRatedModal> movie;

  GetTopRatedMovieSuccess({required this.movie});
}
