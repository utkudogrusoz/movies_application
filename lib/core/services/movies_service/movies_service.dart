import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_application/core/constants/url/url_constants.dart';

import 'package:movies_application/core/models/movie_models/movies_models/movie_answer_model.dart';
import 'package:movies_application/core/models/movie_models/movies_models/movie_model.dart';

class MoviesServices{

  List<MovieModel> _movieAnswerService(String answer){

    var decoded=json.decode(answer);

    return MovieAnswerModel.fromJson(decoded).movies;



  }

    Future<List<MovieModel>> movieService()async{

      var response=await http.get(UrlConstants.ALL_MOVIES);

      return _movieAnswerService(response.body);
      



    }







}