part of 'add_gallery_cubit.dart';

sealed class AddGalleryState extends Equatable {
  const AddGalleryState();

  @override
  List<Object> get props => [];
}

final class AddGalleryInitial extends AddGalleryState {}

final class AddGalleryLoading extends AddGalleryState {}

final class AddGallerySuccess extends AddGalleryState {}
