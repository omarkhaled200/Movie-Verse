import 'package:dartz/dartz.dart';
import 'package:movie_verse/Core/errors/failure.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/detials/detials.model.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/similar_movie_modal.dart';

abstract class DetialsRepo {
  Future<Either<Failure, DetialsModel>> getDetialsMovie({required int id});
  Future<Either<Failure, List<SimilarMovieModal>>> getSimilarMovie({
    required int id,
  });
}
