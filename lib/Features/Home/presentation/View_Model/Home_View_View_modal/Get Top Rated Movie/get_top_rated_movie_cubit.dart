import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Home%20Repo/Home_Repo.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/top_rated_modal.dart';

part 'get_top_rated_movie_state.dart';

class GetTopRatedMovieCubit extends Cubit<GetTopRatedMovieState> {
  GetTopRatedMovieCubit(this.homeRepo) : super(GetTopRatedMovieInitial());
  final HomeRepo homeRepo;
  Future<void> getTopRatedMovie() async {
    if (isClosed) return;
    emit(GetTopRatedMovieLoading());

    var result = await homeRepo.getTopRatedMovie();

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(GetTopRatedMovieFailure(errmessage: failure.errmessage));
        }
      },
      (movie) {
        if (!isClosed) {
          emit(GetTopRatedMovieSuccess(movie: movie));
        }
      },
    );
  }
}
