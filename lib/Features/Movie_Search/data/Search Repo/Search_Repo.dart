import 'package:dartz/dartz.dart';
import 'package:movie_verse/Core/errors/failure.dart';
import 'package:movie_verse/Features/Movie_Search/data/model/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<SearchModel>>> fetchshearchdata({
    required String title,
  });
}
