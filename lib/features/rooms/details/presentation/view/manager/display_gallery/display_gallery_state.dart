part of 'display_gallery_cubit.dart';

sealed class DisplayGalleryState extends Equatable {
  const DisplayGalleryState();

  @override
  List<Object> get props => [];
}

final class DisplayGalleryInitial extends DisplayGalleryState {}

final class DisplayGalleryLoading extends DisplayGalleryState {}

final class DisplayGallerySuccess extends DisplayGalleryState {
  final List<GalleryEntity> galleries;
  const DisplayGallerySuccess({required this.galleries});
}

final class DisplayGalleryFailure extends DisplayGalleryState {
  final String errorMessage;
  const DisplayGalleryFailure({required this.errorMessage});
}
