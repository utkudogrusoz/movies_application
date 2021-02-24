class DirectorModel {
  String director_id;
  String director_name;

  DirectorModel(this.director_id, this.director_name);

  factory DirectorModel.fromJson(Map<String, dynamic> json) {
    var director_id = json["director_id"]as String;
    var director_name = json["director_name"]as String;

    return DirectorModel(director_id, director_name);
  }
}
