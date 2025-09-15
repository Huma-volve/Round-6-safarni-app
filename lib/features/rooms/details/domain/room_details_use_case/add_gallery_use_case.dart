import 'package:safarni/features/rooms/details/domain/repo/gallery_repo.dart';

class AddGalleryUseCase {
  final GalleryRepo galleryRepo;

  AddGalleryUseCase({required this.galleryRepo});
  Future<void> call({required String image}) async {
    await galleryRepo.addGallery(image: image);
  }
}
