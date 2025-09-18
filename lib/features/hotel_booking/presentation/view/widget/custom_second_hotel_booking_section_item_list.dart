import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/loading/hotels_loading.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/hotel_booking/presentation/manager/cubit/get_hotels_cubit.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_second_hotel_booking_section_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSecondHotelBookingSectionItemList extends StatelessWidget {
  const CustomSecondHotelBookingSectionItemList({
    required this.hotels,
    super.key,
    this.onSelected,
  });
  final ValueChanged<List<HotelsEntity>>? onSelected;
  final List<HotelsEntity> hotels;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetHotelsCubit, GetHotelsState>(
      listener: (context, state) {
        if (state is GetHotelsSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            onSelected!(state.hotels);
          });
        }
      },
      builder: (context, state) {
        if (state is GetHotelsSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.30,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CustomSecondHotelBookingSectionItem(
                  hotelsEntity: hotels[index],
                ),
              ),
            ),
          );
        } else if (state is GetHotelsFailure) {
          return Center(child: Text(state.error));
        } else {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.30,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) => Skeletonizer(
                effect: ShimmerEffect(
                  baseColor: Colors.grey.shade200,

                  highlightColor: Colors.grey.shade100,
                ),
                child: CustomSecondHotelBookingSectionItem(
                  hotelsEntity: getHotelsDummy(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
