import 'package:movies_application/core/models/movie_models/directors_models/director_model.dart';


class DirectorAnswerModel {
  int success;
  List<DirectorModel> directors;

  DirectorAnswerModel(this.success, this.directors);

  factory DirectorAnswerModel.fromJson(Map<String, dynamic> json) {
    var success = json["success"] as int;
    var transformList = json["directors"] as List;

    List<DirectorModel> directors =
        transformList.map((e) => DirectorModel.fromJson(e)).toList();

    return DirectorAnswerModel(success, directors);
  }
}
