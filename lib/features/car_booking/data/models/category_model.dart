import 'package:safarni/features/car_booking/domain/entits/category_entity.dart';

class CategoryModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
    );
  }

  Category toEntity() {
    return Category(
      id: id,
      name: name,
      description: description,
      imageUrl: imageUrl,
    );
  }
}
