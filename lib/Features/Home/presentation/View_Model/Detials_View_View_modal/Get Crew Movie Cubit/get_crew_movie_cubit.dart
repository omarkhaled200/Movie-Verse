import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Detials%20Repos/Detials_Repo.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/cast_and_crew_model/crew.dart';

part 'get_crew_movie_state.dart';

class GetCrewMovieCubit extends Cubit<GetCrewMovieState> {
  GetCrewMovieCubit(this.detialsRepo) : super(GetCrewMovieInitial());
  final DetialsRepo detialsRepo;
  Future<void> getCrewMoive({required int id}) async {
    if (isClosed) return;
    emit(GetCrewMovieLoading());

    var result = await detialsRepo.getCrewMoive(id: id);
    print("the result in cubit is : $result");
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(GetCrewMovieFailure(errmessage: failure.errmessage));
        }
      },
      (crew) {
        if (!isClosed) {
          print("the movie from cubit:$crew");
          emit(GetCrewMovieSuccess(crew: crew));
        }
      },
    );
  }
}
