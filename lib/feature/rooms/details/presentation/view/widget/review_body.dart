import 'package:flutter/material.dart';
import 'package:safarni/core/widget/search_text_field.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_review_header.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_review_list.dart';

class ReviewBody extends StatelessWidget {
  const ReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomReviewHeader(),
        SizedBox(height: 24),
        CustomSearchTextfield(),
        SizedBox(height: 24),
        CustomReviewList(),
      ],
    );
  }
}
