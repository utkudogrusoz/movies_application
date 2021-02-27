
import 'package:movies_application/core/constants/url/url_constants.dart';

import 'package:movies_application/core/models/movie_models/categories_model/category_answer_model.dart';
import 'package:movies_application/core/models/movie_models/categories_model/category_model.dart';
import 'package:movies_application/core/services/movies_service/base_service.dart';

class CategoriesService {

  Future<List<CategoryModel>>categoriesService () async {
    return BaseServices()
        .baseService(UrlConstants.CATEGORIES_MOVIES)
        .then((value) {return CategoryAnswerModel.fromJson(value).categories;});
  }
  
}
