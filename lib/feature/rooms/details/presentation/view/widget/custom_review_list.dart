import 'package:flutter/cupertino.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_review.dart';

class CustomReviewList extends StatelessWidget {
  const CustomReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: CustomReview(),
        ),
      ),
    );
  }
}
