import 'package:equatable/equatable.dart';

class Destantion extends Equatable {
  final int id;
  final String title;
  final String location;
  final String description;
  final String price;
  final String image;

  const Destantion({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.price,
    required this.image,
  });
  @override
  List<Object?> get props => [id, title, location, description, price, image];
}
