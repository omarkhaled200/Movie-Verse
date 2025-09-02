part of 'get_movie_search_cubit.dart';

sealed class GetMovieSearchState extends Equatable {
  const GetMovieSearchState();

  @override
  List<Object> get props => [];
}

final class GetMovieSearchInitial extends GetMovieSearchState {}

final class GetMovieSearchLoading extends GetMovieSearchState {}

final class GetMovieSearchFailure extends GetMovieSearchState {
  final String errmessage;

  GetMovieSearchFailure({required this.errmessage});
}

final class GetMovieSearchSucces extends GetMovieSearchState {
  final List<SearchModel> movie;

  GetMovieSearchSucces({required this.movie});
}
