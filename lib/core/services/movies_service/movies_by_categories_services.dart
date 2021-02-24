import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_application/core/constants/url/url_constants.dart';

import 'package:movies_application/core/models/movie_models/movies_models/movie_answer_model.dart';
import 'package:movies_application/core/models/movie_models/movies_models/movie_model.dart';

class FilmByCategoryService {
  List<MovieModel> _filmByCategoriesAnswerService(String answer) {
    var decoded = json.decode(answer);

    return MovieAnswerModel.fromJson(decoded).movies;
  }

  Future<List<MovieModel>> filmByCategoryService(int category_id) async {
    var data = {"category_id":category_id.toString()};
    var response =
        await http.post(UrlConstants.MOVIES_IF_CATEGORIES, body: data);
    return _filmByCategoriesAnswerService(response.body);
  }
}
