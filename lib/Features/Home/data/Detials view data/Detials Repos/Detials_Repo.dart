import 'package:dartz/dartz.dart';
import 'package:movie_verse/Core/errors/failure.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/cast_and_crew_model/cast.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/cast_and_crew_model/crew.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/detials/detials.model.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/similar_movie_modal.dart';
import 'package:movie_verse/Features/Home/data/Detials%20view%20data/Model/trailar_modal.dart';

abstract class DetialsRepo {
  Future<Either<Failure, DetialsModel>> getDetialsMovie({required int id});
  Future<Either<Failure, TrailarModal>> getTrailarMoive({required int id});
  Future<Either<Failure, List<SimilarMovieModal>>> getSimilarMovie({
    required int id,
  });
  Future<Either<Failure, List<Cast>>> getCastMoive({required int id});
  Future<Either<Failure, List<Crew>>> getCrewMoive({required int id});
}
