import 'package:shamo/models/category_model.dart';

import 'gallery_model.dart';

class ProductModel {
  final int? id;
  final String? name;
  final int? price;
  final String? description;
  final String? tags;
  final CategoryModel? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<GalleryModel> galleries;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    required this.galleries,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        description: json['description'],
        tags: json['tags'],
        category: CategoryModel.fromJson(
          json['category'],
        ),
        galleries: json["galleries"]
            .map<GalleryModel>((image) => GalleryModel.fromJson(image))
            .toList(),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );
}
