import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Detials%20Repos/Detials_Repo.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/trailar_modal.dart';

part 'get_trailar_moive_state.dart';

class GetTrailarMoiveCubit extends Cubit<GetTrailarMoiveState> {
  GetTrailarMoiveCubit(this.detialsRepo) : super(GetTrailarMoiveInitial());
  final DetialsRepo detialsRepo;
  Future<void> getTrailarMovie({required int id}) async {
    if (isClosed) return;
    emit(GetTrailarMoiveLoading());

    var result = await detialsRepo.getTrailarMoive(id: id);
    print("the result in cubit is : $result");
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(GetTrailarMoiveFailure(errmessage: failure.errmessage));
        }
      },
      (movie) {
        if (!isClosed) {
          print("the movie from cubit:$movie");
          emit(GetTrailarMoiveSuccess(movie: movie));
        }
      },
    );
  }
}
