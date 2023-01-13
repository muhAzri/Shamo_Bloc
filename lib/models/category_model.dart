class CategoryModel {
  final int id;
  final String? name;

  CategoryModel({this.id = -1, this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        name: json['name'],
      );
}
