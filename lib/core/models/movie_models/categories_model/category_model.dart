class CategoryModel {
  String category_id;
  String category_name;

  CategoryModel(this.category_id, this.category_name);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    var category_id = json["category_id"] as String;
    var category_name = json["category_name"]as String;

    return CategoryModel(category_id, category_name);
  }
}
