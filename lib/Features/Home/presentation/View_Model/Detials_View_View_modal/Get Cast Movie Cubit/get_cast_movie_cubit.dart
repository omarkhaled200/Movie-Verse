import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Detials%20Repos/Detials_Repo.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/cast_and_crew_model/cast.dart';

part 'get_cast_movie_state.dart';

class GetCastMovieCubit extends Cubit<GetCastMovieState> {
  GetCastMovieCubit(this.detialsRepo) : super(GetCastMovieInitial());
  final DetialsRepo detialsRepo;
  Future<void> getCastMovie({required int id}) async {
    if (isClosed) return;
    emit(GetCastMovieLoading());

    var result = await detialsRepo.getCastMoive(id: id);
    print("the result in cubit is : $result");
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(GetCastMovieFailure(errmessage: failure.errmessage));
        }
      },
      (cast) {
        if (!isClosed) {
          emit(GetCastMovieSuccess(cast: cast));
        }
      },
    );
  }
}
