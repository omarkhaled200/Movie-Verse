import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_verse/Core/errors/failure.dart';
import 'package:movie_verse/Core/utlis/api_class.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Detials%20Repos/Detials_Repo.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/cast_and_crew_model/cast.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/cast_and_crew_model/crew.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/detials/detials.model.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/similar_movie_modal.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/trailar_modal.dart';

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

  @override
  Future<Either<Failure, TrailarModal>> getTrailarMoive({
    required int id,
  }) async {
    try {
      var data = await apiClass.get(endpoint: '/movie/$id/videos');

      var videosData = data['results'] as List;
      var trailers = videosData
          .where(
            (video) => video['type'] == 'Trailer' && video['official'] == true,
          )
          .toList();

      if (trailers.isEmpty) {
        return left(ServerFailure("No trailer found"));
      }

      TrailarModal movie = TrailarModal.fromJson(trailers.first);
      return right(movie);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Cast>>> getCastMoive({required int id}) async {
    try {
      var data = await apiClass.get(
        endpoint: '/movie/$id?append_to_response=credits',
      );

      List<Cast> cast = (data['credits']['cast'] as List)
          .map((item) => Cast.fromJson(item))
          .where((c) => c.order != null)
          .toList();

      cast.sort((a, b) => a.order!.compareTo(b.order!));

      List<Cast> top10Cast = cast.take(10).toList();

      return right(top10Cast);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Crew>>> getCrewMoive({required int id}) async {
    try {
      var data = await apiClass.get(
        endpoint: '/movie/$id?append_to_response=credits',
      );

      List<Crew> crew = (data['credits']['crew'] as List)
          .map((item) => Crew.fromJson(item))
          .toList();

      List<Crew> mainCrew = crew
          .where(
            (c) =>
                c.job == 'Director' ||
                c.job == 'Screenplay' ||
                c.job == 'Writer' ||
                c.job == 'Producer',
          )
          .toList();

      return right(mainCrew);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
