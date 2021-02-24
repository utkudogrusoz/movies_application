import 'package:movies_application/core/models/movie_models/movies_models/movie_model.dart';


class MovieAnswerModel {
  int success;
  List<MovieModel> movies;

  MovieAnswerModel(this.success, this.movies);

  factory MovieAnswerModel.fromJson(Map<String, dynamic> json) {
    var success = json["success"] as int;
    var transformList = json["movies"] as List;

    var movies = transformList.map((e) => MovieModel.fromJson(e)).toList();

    return MovieAnswerModel(success, movies);
  }
}
