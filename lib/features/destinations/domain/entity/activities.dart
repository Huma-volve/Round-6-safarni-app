import 'package:equatable/equatable.dart';

class Activities extends Equatable {
  final int id;
  final String name; // اللي تحت الصورة
  final double rateing;
  final String location;
  final String image; //الصورة بتاعت activite
  final String bestTimetoVisit;

  const Activities({
    required this.id,
    required this.name,
    required this.rateing,
    required this.location,
    required this.image,
    required this.bestTimetoVisit,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    rateing,
    location,
    image,
    bestTimetoVisit,
  ];
}
