import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/loading/review_loading.dart';
import 'package:safarni/core/model/empty_data_model.dart';
import 'package:safarni/features/rooms/details/domain/entity/review_entity.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/display_review_cubit/display_review_cubit.dart';
import 'package:safarni/core/widgets/custom_empty_data.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_review.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomReviewList extends StatelessWidget {
  const CustomReviewList({
    required this.onReview,
    required this.reviews,
    super.key,
  });
  final void Function(List<ReviewEntity>) onReview;
  final List<ReviewEntity> reviews;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DisplayReviewCubit, DisplayReviewState>(
      listener: (context, state) {
        if (state is DisplayReviewSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            onReview(state.reviews);
          });
        }
      },
      builder: (context, state) {
        if (state is DisplayReviewSuccess) {
          if (state.reviews.isEmpty) {
            return CustomEmptyData(emptyDataModel: EmptyDataModel.list[0]);
          }

          return ListView.builder(
            itemCount: reviews.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: CustomReview(review: reviews[index]),
            ),
          );
        } else if (state is DisplayReviewFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Skeletonizer(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: CustomReview(review: getReviewsDummy()),
              ),
            ),
          );
        }
      },
    );
  }
}
