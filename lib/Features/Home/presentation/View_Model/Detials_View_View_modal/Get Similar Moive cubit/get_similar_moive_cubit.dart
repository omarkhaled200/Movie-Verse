import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Detials%20Repos/Detials_Repo.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/similar_movie_modal.dart';

part 'get_similar_moive_state.dart';

class GetSimilarMoiveCubit extends Cubit<GetSimilarMoiveState> {
  GetSimilarMoiveCubit(this.detialsRepo) : super(GetSimilarMoiveInitial());
  final DetialsRepo detialsRepo;
  Future<void> GetSimilarMoive({required int id}) async {
    if (isClosed) return;
    emit(GetSimilarMoiveLoading());

    var result = await detialsRepo.getSimilarMovie(id: id);

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(GetSimilarMoiveFailure(errmessage: failure.errmessage));
        }
      },
      (movie) {
        if (!isClosed) {
          emit(GetSimilarMoiveSuccess(movie: movie));
        }
      },
    );
  }
}
