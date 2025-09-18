import 'package:safarni/features/destinations/domain/entity/destantion.dart';

class DestantionModel extends Destantion {
  const DestantionModel({
    required super.id,
    required super.title,
    required super.location,
    required super.description,
    required super.price,
    required super.image,
  });

  factory DestantionModel.fromJson(Map<String, dynamic> json) =>
      DestantionModel(
        id: json['id'],
        title: json['title'],
        location: json['location'],
        description: json['description'],
        price: json['price'],
        image: json['image'],
      );
}
