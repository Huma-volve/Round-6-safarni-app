import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_images.dart';

class GalleryImageListView extends StatelessWidget {
  const GalleryImageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 9),
        child: Image.asset(AppImages.imagesTest6, fit: BoxFit.fill),
      ),
    );
  }
}
