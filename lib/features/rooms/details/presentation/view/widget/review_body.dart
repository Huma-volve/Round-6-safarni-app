import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';
import 'package:safarni/features/rooms/details/domain/repo/review_repo.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/add_review_cubit/add_review_cubit.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/display_review_cubit/display_review_cubit.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/review_body_bloc.dart';

class ReviewBody extends StatelessWidget {
  const ReviewBody({
    required this.roomDetailsEntity,
    required this.hotelsEntity,
    super.key,
  });
  final RoomDetailsEntity roomDetailsEntity;
  final HotelsEntity hotelsEntity;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddReviewCubit(sl.get<ReviewRepo>())),
        BlocProvider(
          create: (context) =>
              DisplayReviewCubit(sl.get<ReviewRepo>())..displayReview(),
        ),
      ],
      child: ReviewBodyBloc(
        roomDetailsEntity: roomDetailsEntity,
        hotelsEntity: hotelsEntity,
      ),
    );
  }
}
