import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_size.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_gallery.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/gallery_image_list_view.dart';

class GalleryBody extends StatelessWidget {
  const GalleryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.padding),
      child: Column(
        children: [
          const CustomGallery(),
          const SizedBox(height: 16),

          SizedBox(
            height: MediaQuery.sizeOf(context).height * .2,
            child: const GalleryImageListView(),
          ),
        ],
      ),
    );
  }
}
