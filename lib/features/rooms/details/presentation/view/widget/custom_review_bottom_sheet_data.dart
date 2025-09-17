import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/helper/custom_snack_bar.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_discount.dart';
import 'package:safarni/features/rooms/details/domain/entity/review_entity.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/add_review_cubit/add_review_cubit.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/display_review_cubit/display_review_cubit.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_add_photo.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_button.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_rate_and_review.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_review_text_field.dart';

class CustomReviewBottomSheetData extends StatefulWidget {
  const CustomReviewBottomSheetData({
    required this.roomDetailsEntity,
    required this.controller,
    required this.primeContext,
    required this.hotelsEntity,
    super.key,
  });

  final RoomDetailsEntity roomDetailsEntity;
  final ScrollController controller;
  final BuildContext primeContext;
  final HotelsEntity hotelsEntity;
  @override
  State<CustomReviewBottomSheetData> createState() =>
      _CustomReviewBottomSheetDataState();
}

class _CustomReviewBottomSheetDataState
    extends State<CustomReviewBottomSheetData> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> key = GlobalKey();
  String name = '', desc = '', image = '';
  double rate = 0.0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.controller,
      child: Form(
        autovalidateMode: autovalidateMode,
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomRoomDiscount(discount: widget.roomDetailsEntity.discount),
                const Spacer(),
                CustomRateAndReview(
                  primeContext: widget.primeContext,
                  averageRating: widget.roomDetailsEntity.averageRating,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.hotelsEntity.name,
              style: AppStyles.textMedium20(
                context: context,
              ).copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(height: 16),
            Text(
              widget.hotelsEntity.location,
              style: AppStyles.textRegular13(
                context: context,
              ).copyWith(color: AppColors.fifthColor, height: 1.23),
            ),
            const SizedBox(height: 24),
            Container(height: .5, color: Colors.grey, width: double.infinity),
            const SizedBox(height: 16),
            Align(
              child: Text(
                'Your Over Rating Of This Product',
                textAlign: TextAlign.center,
                style: AppStyles.textRegular16(
                  context: context,
                ).copyWith(color: AppColors.fifthColor),
              ),
            ),
            const SizedBox(height: 16),

            Align(
              child: RatingBar.builder(
                minRating: 1,
                allowHalfRating: true,
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {
                  rate = rating;
                },
              ),
            ),
            const SizedBox(height: 24),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Add Your Name ',
                style: AppStyles.textRegular17(
                  context: context,
                ).copyWith(color: AppColors.primaryColor),
              ),
            ),
            const SizedBox(height: 8),
            CustomReviewTextField(
              hintText: 'Enter Your Name',
              maxLines: 1,
              onChanged: (value) {
                name = value;
              },
            ),
            const SizedBox(height: 16),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Add detailed review ',
                style: AppStyles.textRegular17(
                  context: context,
                ).copyWith(color: AppColors.primaryColor),
              ),
            ),
            const SizedBox(height: 16),
            CustomReviewTextField(
              hintText: 'Enter here',
              maxLines: 5,
              onChanged: (value) {
                desc = value;
              },
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 24),
            CustomAddPhoto(
              onImageSelected: (value) {
                image = value;
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              title: 'Submit',
              onPressed: () {
                if (key.currentState!.validate()) {
                  key.currentState?.save();
                  BlocProvider.of<AddReviewCubit>(
                    widget.primeContext,
                  ).addReview(
                    review: ReviewEntity(
                      rate: rate,
                      desc: desc,
                      date: DateTime.now().toString(),
                      image: image,
                      name: name,
                    ),
                  );
                  BlocProvider.of<DisplayReviewCubit>(
                    widget.primeContext,
                  ).displayReview();
                  Navigator.of(context).pop();
                  customSnackBar(context, 'Added Review is Success');
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                  customSnackBar(
                    context,
                    isError: true,
                    'Added Review is failure',
                  );
                }
              },
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
