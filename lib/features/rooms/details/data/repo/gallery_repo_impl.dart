import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/rooms/details/domain/entity/gallery_entity.dart';
import 'package:safarni/features/rooms/details/domain/repo/gallery_repo.dart';

class GalleryRepoImpl extends GalleryRepo {
  @override
  Future<void> addGallery({required String image}) async {
    final gallery = GalleryEntity(image: image);
    try {
      final box = Hive.box<GalleryEntity>('gallery');
      box.add(gallery);
      return Future.value();
    } catch (e) {
      return Future.error(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GalleryEntity>>> getGalleries() async {
    try {
      final box = Hive.box<GalleryEntity>('gallery');
      final galleries = box.values.toList();
      return Right(galleries);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
