import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Home%20Repo/Home_Repo.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/popluar_modal.dart';

part 'get_popular_movie_state.dart';

class GetPopularMovieCubit extends Cubit<GetPopularMovieState> {
  GetPopularMovieCubit(this.homeRepo) : super(GetPopularMovieInitial());
  final HomeRepo homeRepo;
  Future<void> getPopularMovie() async {
    if (isClosed) return;
    emit(GetPopularMovieLoading());

    var result = await homeRepo.getPopularMovie();

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(GetPopularMovieFailure(errmessage: failure.errmessage));
        }
      },
      (movie) {
        if (!isClosed) {
          emit(GetPopularMovieSuccess(movie: movie));
        }
      },
    );
  }
}
