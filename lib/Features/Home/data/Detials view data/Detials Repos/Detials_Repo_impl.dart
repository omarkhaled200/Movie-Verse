import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_verse/Core/errors/failure.dart';
import 'package:movie_verse/Core/utlis/api_class.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Detials%20Repos/Detials_Repo.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/detials/detials.model.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/similar_movie_modal.dart';

class DetialsRepoImpl extends DetialsRepo {
  final ApiClass apiClass;

  DetialsRepoImpl(this.apiClass);

  @override
  Future<Either<Failure, DetialsModel>> getDetialsMovie({
    required int id,
  }) async {
    try {
      var data = await apiClass.get(endpoint: '/movie/$id');
      DetialsModel movie = DetialsModel.fromJson(data);
      return right(movie);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SimilarMovieModal>>> getSimilarMovie({
    required int id,
  }) async {
    try {
      var data = await apiClass.get(endpoint: '/movie/$id/similar');

      List<SimilarMovieModal> movie = [];
      for (var item in data['results']) {
        movie.add(SimilarMovieModal.fromJson(item));
      }

      return right(movie);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
