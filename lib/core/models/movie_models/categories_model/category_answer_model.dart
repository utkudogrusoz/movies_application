

import 'package:movies_application/core/models/movie_models/categories_model/category_model.dart';

class CategoryAnswerModel {
  int success;
  List<CategoryModel> categories;

  CategoryAnswerModel(this.success, this.categories);

  factory CategoryAnswerModel.fromJson(Map<String, dynamic> json) {
    var success = json["success"] as int;

    var transformList = json["categories"] as List;

    var categories =
        transformList.map((e) => CategoryModel.fromJson(e)).toList();

    return CategoryAnswerModel(success, categories);
  }
}
