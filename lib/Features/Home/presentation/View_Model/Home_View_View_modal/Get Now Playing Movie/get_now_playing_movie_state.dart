part of 'get_now_playing_movie_cubit.dart';

sealed class GetNowPlayingMovieState extends Equatable {
  const GetNowPlayingMovieState();

  @override
  List<Object> get props => [];
}

final class GetNowPlayingMovieInitial extends GetNowPlayingMovieState {}

final class GetNowPlayingMovieLoading extends GetNowPlayingMovieState {}

final class GetNowPlayingMovieFailure extends GetNowPlayingMovieState {
  final String errmessage;

  GetNowPlayingMovieFailure({required this.errmessage});
}

final class GetNowPlayingMovieSuccess extends GetNowPlayingMovieState {
  final List<NowPlayingmodal> movie;

  GetNowPlayingMovieSuccess({required this.movie});
}
