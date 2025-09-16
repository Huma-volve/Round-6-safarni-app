import 'package:flutter/material.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_add_photo.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_gallery_count.dart';

class CustomGallery extends StatelessWidget {
  const CustomGallery({required this.onImageSelected, super.key});
  final ValueChanged<String> onImageSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomGalleryCount(),
        CustomAddPhoto(onImageSelected: onImageSelected),
      ],
    );
  }
}
