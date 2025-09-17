import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/rooms/details/domain/entity/gallery_entity.dart';

abstract class GalleryRepo {
  Future<void> addGallery({required String image});
  Future<Either<Failure, List<GalleryEntity>>> getGalleries();
}
