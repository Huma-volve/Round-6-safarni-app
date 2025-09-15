import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safarni/features/rooms/details/domain/entity/gallery_entity.dart';
import 'package:safarni/features/rooms/details/domain/room_details_use_case/display_gallery_use_case.dart';

part 'display_gallery_state.dart';

class DisplayGalleryCubit extends Cubit<DisplayGalleryState> {
  DisplayGalleryCubit(this.displayGalleryUseCase)
    : super(DisplayGalleryInitial());
  final DisplayGalleryUseCase displayGalleryUseCase;
  int count = 0;
  Future<void> getGalleries() async {
    emit(DisplayGalleryLoading());
    final result = await displayGalleryUseCase.call();
    result.fold(
      (failure) =>
          emit(DisplayGalleryFailure(errorMessage: failure.errorMessage)),
      (galleries) {
        count = galleries.length;
        emit(DisplayGallerySuccess(galleries: galleries));
      },
    );
  }
}
