part of 'get_detial_movie_view_cubit.dart';

sealed class GetDetialMovieViewState extends Equatable {
  const GetDetialMovieViewState();

  @override
  List<Object> get props => [];
}

final class GetDetialMovieViewInitial extends GetDetialMovieViewState {}

final class GetDetialMovieViewLoading extends GetDetialMovieViewState {}

final class GetDetialMovieViewFailure extends GetDetialMovieViewState {
  final String errmessage;

  GetDetialMovieViewFailure({required this.errmessage});
}

final class GetDetialMovieViewSuccess extends GetDetialMovieViewState {
  final DetialsModel movie;

  GetDetialMovieViewSuccess({required this.movie});
}
