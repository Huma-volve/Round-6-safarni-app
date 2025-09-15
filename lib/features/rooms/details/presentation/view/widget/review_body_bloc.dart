import 'package:flutter/material.dart';
import 'package:safarni/core/widgets/search_text_field.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/rooms/details/domain/entity/review_entity.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_review_header.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_review_list.dart';

class ReviewBodyBloc extends StatefulWidget {
  const ReviewBodyBloc({
    required this.roomDetailsEntity,
    required this.hotelsEntity,
    super.key,
  });
  final RoomDetailsEntity roomDetailsEntity;
  final HotelsEntity hotelsEntity;

  @override
  State<ReviewBodyBloc> createState() => _ReviewBodyBlocState();
}

class _ReviewBodyBlocState extends State<ReviewBodyBloc> {
  List<ReviewEntity> reviews = [];
  List<ReviewEntity> filteredList = [];
  void handleReviewList(List<ReviewEntity> loadedList) {
    setState(() {
      reviews = loadedList;
      filteredList = loadedList;
    });
  }

  void searchAboutItem(String keyword) {
    setState(() {
      filteredList = reviews
          .where(
            (element) =>
                element.name!.toLowerCase().contains(keyword.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomReviewHeader(
            roomDetailsEntity: widget.roomDetailsEntity,
            hotelsEntity: widget.hotelsEntity,
          ),
          const SizedBox(height: 24),
          CustomSearchTextfield(onChanged: searchAboutItem),

          CustomReviewList(onReview: handleReviewList, reviews: filteredList),
        ],
      ),
    );
  }
}
