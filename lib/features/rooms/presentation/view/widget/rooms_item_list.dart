import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/loading/hotels_loading.dart';
import 'package:safarni/core/loading/rooms_loading.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_data_empity.dart';
import 'package:safarni/features/rooms/domain/entity/rooms_entity.dart';
import 'package:safarni/features/rooms/presentation/manager/cubit/rooms_cubit.dart';
import 'package:safarni/features/rooms/presentation/view/widget/room_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RoomsItemList extends StatefulWidget {
  const RoomsItemList({
    required this.hotelsEntity,
    required this.onItemTap,
    required this.rooms,
    super.key,
  });
  final List<RoomsEntity> rooms;
  final HotelsEntity hotelsEntity;
  final ValueChanged<List<RoomsEntity>> onItemTap;

  @override
  State<RoomsItemList> createState() => _RoomsItemListState();
}

class _RoomsItemListState extends State<RoomsItemList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoomsCubit, RoomsState>(
      listener: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (state is RoomsSuccess) {
            widget.onItemTap(state.rooms);
          }
        });
      },
      builder: (context, state) {
        if (state is RoomsSuccess) {
          if (state.rooms.isEmpty) {
            return const SliverToBoxAdapter(child: CustomListEmpty());
          }
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => RoomsItem(
                roomsEntity: widget.rooms[index],
                hotelsEntity: widget.hotelsEntity,
              ),
              childCount: widget.rooms.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.9,
            ),
          );
        } else if (state is RoomsFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return Skeletonizer.sliver(
            child: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => RoomsItem(
                  roomsEntity: getRoomsDummy(),
                  hotelsEntity: getHotelsDummy(),
                ),
                childCount: 10,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
            ),
          );
        }
      },
    );
  }
}
