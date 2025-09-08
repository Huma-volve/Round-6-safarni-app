import 'package:flutter/material.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_add_photo.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_gallery_count.dart';

class CustomGallery extends StatelessWidget {
  const CustomGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [CustomGalleryCount(), CustomAddPhoto()],
    );
  }
}
