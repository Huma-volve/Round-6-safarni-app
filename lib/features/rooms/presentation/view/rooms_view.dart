import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/helper/custom_app_bar.dart';
import 'package:safarni/core/service/get_it_setup.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/rooms/domain/usecase/room_use_case.dart';
import 'package:safarni/features/rooms/presentation/manager/cubit/rooms_cubit.dart';
import 'package:safarni/features/rooms/presentation/view/widget/rooms_view_body.dart';

class RoomsView extends StatelessWidget {
  const RoomsView({required this.hotelsEntity, super.key});
  static const String routeName = 'rooms_view';
  final HotelsEntity hotelsEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RoomsCubit(getIt.get<RoomUseCase>())..getRooms(id: hotelsEntity.id),
      child: Scaffold(
        appBar: customAppBar(context: context),
        body: RoomsViewBody(hotelsEntity: hotelsEntity),
      ),
    );
  }
}
