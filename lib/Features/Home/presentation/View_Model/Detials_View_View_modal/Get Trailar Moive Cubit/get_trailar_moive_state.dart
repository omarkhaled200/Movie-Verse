part of 'get_trailar_moive_cubit.dart';

sealed class GetTrailarMoiveState extends Equatable {
  const GetTrailarMoiveState();

  @override
  List<Object> get props => [];
}

final class GetTrailarMoiveInitial extends GetTrailarMoiveState {}

final class GetTrailarMoiveLoading extends GetTrailarMoiveState {}

final class GetTrailarMoiveFailure extends GetTrailarMoiveState {
  final String errmessage;

  GetTrailarMoiveFailure({required this.errmessage});
}

final class GetTrailarMoiveSuccess extends GetTrailarMoiveState {
  final TrailarModal movie;

  GetTrailarMoiveSuccess({required this.movie});
}
