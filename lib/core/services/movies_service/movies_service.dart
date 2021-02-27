import 'dart:convert';

import 'package:movies_application/core/constants/url/url_constants.dart';
import 'package:movies_application/core/models/movie_models/movies_models/movie_answer_model.dart';
import 'package:movies_application/core/models/movie_models/movies_models/movie_model.dart';
import 'package:movies_application/core/services/movies_service/base_service.dart';

class MoviesServices {
  Future<List<MovieModel>> movieService() {
    return BaseServices().baseService(UrlConstants.ALL_MOVIES).then((value) {
      return MovieAnswerModel.fromJson(value).movies;
    });
  }
}
