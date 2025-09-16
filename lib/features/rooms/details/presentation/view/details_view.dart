import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/rooms/details/domain/repo/review_repo.dart';
import 'package:safarni/features/rooms/details/domain/room_details_use_case/room_details_use_case.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/display_review_cubit/display_review_cubit.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/room_details_cubit/room_details_cubit.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({required this.hotelsEntity, super.key});
  static const String routeName = 'details_view';
  final HotelsEntity hotelsEntity;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              RoomDetailsCubit(sl.get<RoomDetailsUseCase>())
                ..getRoomDetails(id: hotelsEntity.id),
        ),
        BlocProvider(
          create: (context) =>
              DisplayReviewCubit(sl.get<ReviewRepo>())..displayReview(),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: DetailsViewBody(hotelsEntity: hotelsEntity),
      ),
    );
  }
}
