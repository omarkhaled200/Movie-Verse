part of 'get_similar_moive_cubit.dart';

sealed class GetSimilarMoiveState extends Equatable {
  const GetSimilarMoiveState();

  @override
  List<Object> get props => [];
}

final class GetSimilarMoiveInitial extends GetSimilarMoiveState {}

final class GetSimilarMoiveLoading extends GetSimilarMoiveState {}

final class GetSimilarMoiveFailure extends GetSimilarMoiveState {
  final String errmessage;

  GetSimilarMoiveFailure({required this.errmessage});
}

final class GetSimilarMoiveSuccess extends GetSimilarMoiveState {
  final List<SimilarMovieModal> movie;

  GetSimilarMoiveSuccess({required this.movie});
}
