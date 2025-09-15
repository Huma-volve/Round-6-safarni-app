import 'package:hive/hive.dart';
part 'gallery_entity.g.dart';

@HiveType(typeId: 1)
class GalleryEntity extends HiveObject {
  @HiveField(0)
  final String? image;

  GalleryEntity({required this.image});
}
