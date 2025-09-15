import 'package:equatable/equatable.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';

class HotelsModel extends Equatable {
  final int? id;
  final String? name;
  final String? location;
  final String? image;
  final double? averageRating;

  const HotelsModel({
    this.id,
    this.name,
    this.location,
    this.image,
    this.averageRating,
  });

  factory HotelsModel.fromJson(Map<String, dynamic> json) => HotelsModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    location: json['location'] as String?,
    image: json['image'] as String?,
    averageRating: (json['average_rating'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'location': location,
    'image': image,
    'average_rating': averageRating,
  };
  toEntity() {
    return HotelsEntity(
      id: id ?? 0,
      name: name ?? 'anonymous name',
      location: location ?? 'anonymous location',
      image: image ?? 'anonymous image',
      rating: averageRating.toString(),
    );
  }

  @override
  List<Object?> get props => [id, name, location, image, averageRating];
}
