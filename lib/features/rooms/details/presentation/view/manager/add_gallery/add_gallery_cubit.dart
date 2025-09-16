import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safarni/features/rooms/details/domain/room_details_use_case/add_gallery_use_case.dart';

part 'add_gallery_state.dart';

class AddGalleryCubit extends Cubit<AddGalleryState> {
  AddGalleryCubit(this.addGalleryUseCase) : super(AddGalleryInitial());
  final AddGalleryUseCase addGalleryUseCase;

  Future<void> addGallery({required String image}) async {
    emit(AddGalleryLoading());
    await addGalleryUseCase.call(image: image);
    emit(AddGallerySuccess());
  }
}
