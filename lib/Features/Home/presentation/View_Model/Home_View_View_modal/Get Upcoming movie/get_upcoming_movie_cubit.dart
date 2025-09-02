import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Home%20Repo/Home_Repo.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/upcoming_modal.dart';

part 'get_upcoming_movie_state.dart';

class GetUpcomingMovieCubit extends Cubit<GetUpcomingMovieState> {
  GetUpcomingMovieCubit(this.homeRepo) : super(GetUpcomingMovieInitial());
  final HomeRepo homeRepo;
  Future<void> getUpcomingMovie() async {
    if (isClosed) return;
    emit(GetUpcomingMovieLoading());

    var result = await homeRepo.getUpcomingMovie();

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(GetUpcomingMovieFailure(errmessage: failure.errmessage));
        }
      },
      (movie) {
        if (!isClosed) {
          emit(GetUpcomingMovieSuccess(movie: movie));
        }
      },
    );
  }
}
