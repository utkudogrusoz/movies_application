import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_application/core/constants/url/url_constants.dart';

import 'package:movies_application/core/models/movie_models/categories_model/category_answer_model.dart';
import 'package:movies_application/core/models/movie_models/categories_model/category_model.dart';

class CategoriesService {

  
  List<CategoryModel> _categoriesAnswerService(String answer) {
    var decoded = json.decode(answer);

    return CategoryAnswerModel.fromJson(decoded).categories;
  }

  Future<List<CategoryModel>> categoriesService() async {
    var response = await http.get(UrlConstants.CATEGORIES_MOVIES);
    if (response.statusCode == 200) {
      return _categoriesAnswerService(response.body);
    } else {
      print("kategori servis hatası".toUpperCase());
    }
  }
}
