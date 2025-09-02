part of 'get_trending_movie_cubit.dart';

sealed class GetTrendingMovieState extends Equatable {
  const GetTrendingMovieState();

  @override
  List<Object> get props => [];
}

final class GetTrendingMovieInitial extends GetTrendingMovieState {}

final class GetTrendingMovieLoading extends GetTrendingMovieState {}

final class GetTrendingMovieFailure extends GetTrendingMovieState {
  final String errmessage;

  GetTrendingMovieFailure({required this.errmessage});
}

final class GetTrendingMovieSuccess extends GetTrendingMovieState {
  final List<Trendingmodal> movie;

  GetTrendingMovieSuccess({required this.movie});
}
