import 'package:flutter/material.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/about_body.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/gallery_body.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/review_body.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({required this.pageController, super.key});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: getPages(pageController).length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: getPages(pageController)[index],
        );
      },
    );
  }
}

List<Widget> getPages(PageController pageController) {
  return [const AboutBody(), const GalleryBody(), const ReviewBody()];
}
