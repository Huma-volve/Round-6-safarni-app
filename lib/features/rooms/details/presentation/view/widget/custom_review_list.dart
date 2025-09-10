import 'package:flutter/cupertino.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_review.dart';

class CustomReviewList extends StatelessWidget {
  const CustomReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: CustomReview(),
      ),
    );
  }
}
