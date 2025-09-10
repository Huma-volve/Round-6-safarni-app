import 'package:flutter/material.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_gallery.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/gallery_image_list_view.dart';

class GalleryBody extends StatelessWidget {
  const GalleryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomGallery(),
        SizedBox(height: 16),

        Expanded(child: GalleryImageListView()),
      ],
    );
  }
}
