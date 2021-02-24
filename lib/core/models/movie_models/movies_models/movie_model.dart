import 'package:movies_application/core/models/movie_models/categories_model/category_model.dart';
import 'package:movies_application/core/models/movie_models/directors_models/director_model.dart';

class MovieModel {
  String movie_id;
  String movie_name;
  String movie_year;
  String movie_image;
  CategoryModel category;
  DirectorModel director;

  MovieModel(this.movie_id, this.movie_name, this.movie_year, this.movie_image,
      this.category, this.director);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    var movie_id = json["movie_id"]as String;
    var movie_name = json["movie_name"]as String;
    var movie_year = json["movie_year"]as String;
    var movie_image = json["movie_image"]as String;

    var category = CategoryModel.fromJson(json["categories"]) as CategoryModel;
    var director = DirectorModel.fromJson(json["directors"])as DirectorModel;

    return MovieModel(
        movie_id, movie_name, movie_year, movie_image, category, director);
  }
}
