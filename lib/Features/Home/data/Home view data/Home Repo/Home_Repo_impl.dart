import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_verse/Core/errors/failure.dart';
import 'package:movie_verse/Core/utlis/api_class.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Home%20Repo/Home_Repo.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/now_playingmodal.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/popluar_modal.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/top_rated_modal.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/trendingmodal.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/upcoming_modal.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiClass apiClass;

  HomeRepoImpl(this.apiClass);

  @override
  Future<Either<Failure, List<NowPlayingmodal>>> getNowPlayingMovie() async {
    try {
      var data = await apiClass.get(endpoint: '/movie/now_playing');

      List<NowPlayingmodal> movie = [];
      for (var item in data['results']) {
        movie.add(NowPlayingmodal.fromJson(item));
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
  Future<Either<Failure, List<TopRatedModal>>> getTopRatedMovie() async {
    try {
      var data = await apiClass.get(endpoint: '/movie/top_rated');
      List<TopRatedModal> movie = [];
      for (var item in data['results']) {
        movie.add(TopRatedModal.fromJson(item));
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
  Future<Either<Failure, List<Trendingmodal>>> getTrendingMovie() async {
    try {
      var data = await apiClass.get(endpoint: '/trending/movie/day');

      List<Trendingmodal> movie = [];
      for (var item in data['results']) {
        try {
          movie.add(Trendingmodal.fromJson(item));
        } catch (e) {
          print("Error parsing item: $e");
        }
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
  Future<Either<Failure, List<UpcomingModal>>> getUpcomingMovie() async {
    try {
      var data = await apiClass.get(endpoint: '/movie/upcoming');
      List<UpcomingModal> movie = [];
      for (var item in data['results']) {
        movie.add(UpcomingModal.fromJson(item));
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
  Future<Either<Failure, List<PopluarModal>>> getPopularMovie() async {
    try {
      var data = await apiClass.get(endpoint: '/movie/popular');

      List<PopluarModal> movie = [];
      for (var item in data['results']) {
        movie.add(PopluarModal.fromJson(item));
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
