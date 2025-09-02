import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_verse/Features/Movie_Search/data/Search%20Repo/Search_Repo.dart';
import 'package:movie_verse/Features/Movie_Search/data/model/search_model.dart';

part 'get_movie_search_state.dart';

class GetMovieSearchCubit extends Cubit<GetMovieSearchState> {
  GetMovieSearchCubit(this.searchRepo) : super(GetMovieSearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedBook({required String title}) async {
    emit(GetMovieSearchLoading());
    var result = await searchRepo.fetchshearchdata(title: title);
    result.fold(
      (Failure) {
        emit(GetMovieSearchFailure(errmessage: Failure.errmessage));
      },
      (movie) {
        emit(GetMovieSearchSucces(movie: movie));
      },
    );
  }
}
