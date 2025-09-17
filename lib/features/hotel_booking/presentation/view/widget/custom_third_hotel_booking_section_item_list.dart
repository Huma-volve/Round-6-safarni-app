import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/loading/hotels_loading.dart';
import 'package:safarni/core/widgets/error_state_widget.dart';
import 'package:safarni/features/hotel_booking/presentation/manager/cubit/get_hotels_cubit.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_third_hotel_booking_section_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomThirdHotelBookingSectionItemList extends StatelessWidget {
  const CustomThirdHotelBookingSectionItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHotelsCubit, GetHotelsState>(
      builder: (context, state) {
        if (state is GetHotelsSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: CustomThirdHotelBookingSectionItem(
                  hotelsEntity: state.hotels[index],
                ),
              ),
              childCount: state.hotels.length,
            ),
          );
        } else if (state is GetHotelsFailure) {
          return SliverToBoxAdapter(
            child: ErrorStateWidget(message: state.error, onRetry: () {}),
          );
        } else {
          return Skeletonizer.sliver(
            effect: ShimmerEffect(
              baseColor: Colors.grey.shade200,

              highlightColor: Colors.grey.shade100,
            ),
            child: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: CustomThirdHotelBookingSectionItem(
                    hotelsEntity: getHotelsDummy(),
                  ),
                ),
                childCount: 10,
              ),
            ),
          );
        }
      },
    );
  }
}
