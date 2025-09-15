import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/features/rooms/details/domain/entity/gallery_entity.dart';
import 'package:safarni/features/rooms/details/domain/repo/gallery_repo.dart';

class DisplayGalleryUseCase {
  final GalleryRepo galleryRepo;
  DisplayGalleryUseCase({required this.galleryRepo});

  Future<Either<Failure, List<GalleryEntity>>> call() async {
    return await galleryRepo.getGalleries();
  }
}
