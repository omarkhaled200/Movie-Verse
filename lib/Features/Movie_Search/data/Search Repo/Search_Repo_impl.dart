import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_verse/Core/errors/failure.dart';
import 'package:movie_verse/Core/utlis/api_class.dart';
import 'package:movie_verse/Features/Movie_Search/data/Search%20Repo/Search_Repo.dart';
import 'package:movie_verse/Features/Movie_Search/data/model/search_model.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiClass apiClass;

  SearchRepoImpl(this.apiClass);
  @override
  Future<Either<Failure, List<SearchModel>>> fetchshearchdata({
    required String title,
  }) async {
    try {
      var data = await apiClass.get(endpoint: '/search/movie?query=$title');
      print("the data in repo is : $data");
      List<SearchModel> movie = [];
      for (var item in data['results']) {
        try {
          print("parsing item: $item");
          movie.add(SearchModel.fromJson(item));
        } catch (e) {
          print("Error parsing item: $e");
        }
      }
      print("the movie in repo is : $movie");
      return right(movie);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
