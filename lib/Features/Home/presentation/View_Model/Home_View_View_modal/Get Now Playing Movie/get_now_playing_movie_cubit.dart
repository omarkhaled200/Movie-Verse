import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Home%20Repo/Home_Repo.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/now_playingmodal.dart';

part 'get_now_playing_movie_state.dart';

class GetNowPlayingMovieCubit extends Cubit<GetNowPlayingMovieState> {
  GetNowPlayingMovieCubit(this.homeRepo) : super(GetNowPlayingMovieInitial());
  final HomeRepo homeRepo;
  Future<void> getNowPlayingMovie() async {
    if (isClosed) return;
    emit(GetNowPlayingMovieLoading());

    var result = await homeRepo.getNowPlayingMovie();

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(GetNowPlayingMovieFailure(errmessage: failure.errmessage));
        }
      },
      (movie) {
        if (!isClosed) {
          emit(GetNowPlayingMovieSuccess(movie: movie));
        }
      },
    );
  }
}
