import 'package:dartz/dartz.dart';
import 'package:movie_verse/Core/errors/failure.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/now_playingmodal.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/popluar_modal.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/top_rated_modal.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/trendingmodal.dart';
import 'package:movie_verse/Features/Home/data/Home%20view%20data/Model/upcoming_modal.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Trendingmodal>>> getTrendingMovie();
  Future<Either<Failure, List<NowPlayingmodal>>> getNowPlayingMovie();
  Future<Either<Failure, List<TopRatedModal>>> getTopRatedMovie();
  Future<Either<Failure, List<UpcomingModal>>> getUpcomingMovie();
  Future<Either<Failure, List<PopluarModal>>> getPopularMovie();
}
