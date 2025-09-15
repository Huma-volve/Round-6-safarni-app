import 'package:flutter/material.dart';
import 'package:safarni/core/helper/count_small_images_method.dart';
import 'package:safarni/core/widgets/custom_cached_network_image.dart';

class CustomDetailsImagesGroupList extends StatelessWidget {
  final List<String> images;
  final int selectedIndex;
  final Function(int) onImageTap;

  const CustomDetailsImagesGroupList({
    required this.images,
    required this.selectedIndex,
    required this.onImageTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: images.length > 5 ? 6 : images.length,
      itemBuilder: (context, index) {
        if (index == 5 && images.length > 5) {
          final extraCount = images.length - 5;
          return buildExtraBox(extraCount, context: context);
        }
        return GestureDetector(
          onTap: () => onImageTap(index),
          child: Container(
            width: MediaQuery.sizeOf(context).width * .15,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 5),
              borderRadius: index == 0
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                    )
                  : null,
            ),

            child: ClipRRect(
              child: CustomCachedNetworkImage(image: images[index]),
            ),
          ),
        );
      },
    );
  }
}
