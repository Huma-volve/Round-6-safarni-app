import 'package:hive/hive.dart';

part 'review_entity.g.dart';

@HiveType(typeId: 0)
class ReviewEntity extends HiveObject {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? desc;
  @HiveField(3)
  final String? date;
  @HiveField(4)
  final double? rate;

  ReviewEntity({
    required this.rate,
    required this.name,
    required this.image,
    required this.desc,
    required this.date,
  });
}
