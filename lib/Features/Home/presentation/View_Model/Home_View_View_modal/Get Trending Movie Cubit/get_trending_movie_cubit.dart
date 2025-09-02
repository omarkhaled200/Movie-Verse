import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Home%20Repo/Home_Repo.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/trendingmodal.dart';

part 'get_trending_movie_state.dart';

class GetTrendingMovieCubit extends Cubit<GetTrendingMovieState> {
  GetTrendingMovieCubit(this.homeRepo) : super(GetTrendingMovieInitial());
  final HomeRepo homeRepo;
  Future<void> gettrendingmovie() async {
    if (isClosed) return;
    emit(GetTrendingMovieLoading());

    var result = await homeRepo.getTrendingMovie();

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(GetTrendingMovieFailure(errmessage: failure.errmessage));
        }
      },
      (movie) {
        if (!isClosed) {
          emit(GetTrendingMovieSuccess(movie: movie));
        }
      },
    );
  }
}
