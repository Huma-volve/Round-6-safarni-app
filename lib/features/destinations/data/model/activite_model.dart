import 'package:safarni/features/destinations/domain/entity/activities.dart';

class ActiviteModel extends Activities {
  const ActiviteModel({
    required super.id,
    required super.name,
    required super.rateing,
    required super.location,
    required super.image,
    required super.bestTimetoVisit,
  });

  factory ActiviteModel.fromJson(Map<String, dynamic> json) => ActiviteModel(
    id: json['id'],
    name: json['name'],
    rateing: json['rating'],
    location: json['location'],
    image: json['image'],
    bestTimetoVisit: json['best_time_to_visit'],
  );
}
