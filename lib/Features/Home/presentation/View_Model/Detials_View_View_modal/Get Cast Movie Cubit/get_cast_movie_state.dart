part of 'get_cast_movie_cubit.dart';

sealed class GetCastMovieState extends Equatable {
  const GetCastMovieState();

  @override
  List<Object> get props => [];
}

final class GetCastMovieInitial extends GetCastMovieState {}

final class GetCastMovieLoading extends GetCastMovieState {}

final class GetCastMovieFailure extends GetCastMovieState {
  final String errmessage;

  GetCastMovieFailure({required this.errmessage});
}

final class GetCastMovieSuccess extends GetCastMovieState {
  final List<Cast> cast;

  GetCastMovieSuccess({required this.cast});
}
