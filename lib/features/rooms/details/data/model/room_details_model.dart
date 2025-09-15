import 'package:equatable/equatable.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';

class RoomDetailsModel extends Equatable {
  final int? id;
  final String? description;
  final String? price;
  final double? area;
  final int? capacity;
  final int? bathroomNumber;
  final String? image;
  final int? discount;
  final double? averageRating;
  final int? totalReviews;

  const RoomDetailsModel({
    this.id,
    this.description,
    this.price,
    this.area,
    this.capacity,
    this.bathroomNumber,
    this.image,
    this.discount,
    this.averageRating,
    this.totalReviews,
  });

  factory RoomDetailsModel.fromJson(Map<String, dynamic> json) =>
      RoomDetailsModel(
        id: json['id'] as int?,
        description: json['description'] as String?,
        price: json['price'] == null ? 'unknown' : json['price'] as String?,
        area: (json['area'] as num?)?.toDouble(),
        capacity: json['capacity'] as int?,
        bathroomNumber: json['bathroom_number'] as int?,
        image: json['image'] as String?,
        discount: json['discount'] == null ? 0 : json['discount'] as dynamic,
        averageRating:
            (json['average_rating'] == null
                    ? 0
                    : json['average_rating'] as num?)
                ?.toDouble(),
        totalReviews: json['total_reviews'] == null
            ? 0
            : json['total_reviews'] as int?,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'description': description,
    'price': price,
    'area': area,
    'capacity': capacity,
    'bathroom_number': bathroomNumber,
    'image': image,
    'discount': discount,
    'average_rating': averageRating,
    'total_reviews': totalReviews,
  };
  toEntity() {
    return RoomDetailsEntity(
      id: id ?? 0,
      description: description ?? '',
      price: price.toString(),
      area: area.toString(),
      capacity: capacity.toString(),
      bathroomNumber: bathroomNumber.toString(),
      image: image ?? '',
      discount: discount.toString(),
      averageRating: averageRating.toString(),
      totalReviews: totalReviews.toString(),
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      description,
      price,
      area,
      capacity,
      bathroomNumber,
      image,
      discount,
      averageRating,
      totalReviews,
    ];
  }
}
