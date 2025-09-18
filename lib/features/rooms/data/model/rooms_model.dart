import 'package:equatable/equatable.dart';
import 'package:safarni/features/rooms/domain/entity/rooms_entity.dart';

class RoomsModel extends Equatable {
  final int id;
  final String? price;
  final dynamic discount;
  final String? image;

  const RoomsModel({required this.id, this.price, this.discount, this.image});

  factory RoomsModel.fromJson(Map<String, dynamic> json) => RoomsModel(
    id: json['id'] as int,
    price: json['price'] == null ? null : json['price'] as String?,
    discount: json['discount'] == null ? '' : json['discount'] as dynamic,
    image: json['image'] == null ? '' : json['image'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'price': price,
    'discount': discount,
    'image': image,
  };
  toEntity() {
    return RoomsEntity(
      id: id,
      price: price ?? 'unknown',
      discount: discount,
      image: image ?? '',
    );
  }

  @override
  List<Object?> get props => [id, price, discount, image];
}
