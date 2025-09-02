import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Detials%20Repos/Detials_Repo.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/detials/detials.model.dart';

part 'get_detial_movie_view_state.dart';

class GetDetialMovieViewCubit extends Cubit<GetDetialMovieViewState> {
  GetDetialMovieViewCubit(this.detialsRepo)
    : super(GetDetialMovieViewInitial());
  final DetialsRepo detialsRepo;
  Future<void> getMovieDetialCubit({required int id}) async {
    if (isClosed) return;
    emit(GetDetialMovieViewLoading());

    var result = await detialsRepo.getDetialsMovie(id: id);
    print("the result in cubit is : $result");
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(GetDetialMovieViewFailure(errmessage: failure.errmessage));
        }
      },
      (movie) {
        if (!isClosed) {
          print("the movie from cubit:$movie");
          emit(GetDetialMovieViewSuccess(movie: movie));
        }
      },
    );
  }
}
