import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/helper/custom_snack_bar.dart';
import 'package:safarni/core/service/get_it_setup.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';
import 'package:safarni/features/rooms/details/domain/room_details_use_case/my_room_booking_use_case.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/my_room_booking/my_room_booking_cubit.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_continue_button.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_hotel_book.dart';
import 'package:safarni/features/rooms/presentation/view/rooms_view.dart';

Future<dynamic> bookHotelBottomSheet(
  BuildContext context, {
  required BuildContext primeContext,
  required String discount,
  required String averageRating,
  required HotelsEntity hotelsEntity,
  required RoomDetailsEntity roomsEntity,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.white,
    context: context,
    builder: (context) {
      String checkIn = '', checkOut = '';
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              CustomHotelBook(
                onCheckInChanged: (value) {
                  log(value);
                  checkIn = value;
                },
                onCheckOutChanged: (value) {
                  log(value);
                  checkOut = value;
                },
                hotelsEntity: hotelsEntity,
                primeContext: primeContext,
                discount: discount,
                averageRating: averageRating,
              ),
              BlocProvider(
                create: (context) =>
                    MyRoomBookingCubit(getIt.get<MyRoomBookingUseCase>()),
                child: BlocListener<MyRoomBookingCubit, MyRoomBookingState>(
                  listener: (context, state) {
                    if (state is MyRoomBookingSuccess) {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(
                        context,
                        RoomsView.routeName,
                        arguments: hotelsEntity,
                      );
                      customSnackBar(context, 'Room Booked Successfully');
                    } else if (state is MyRoomBookingFailure) {
                      Navigator.pop(context);
                      customSnackBar(
                        context,
                        state.errorMessage,
                        isError: true,
                      );
                    }
                  },
                  child: Builder(
                    builder: (blocContext) {
                      return CustomContinueButton(
                        cubitContext: blocContext,
                        primeContext: primeContext,
                        checkIn: checkIn,
                        checkOut: checkOut,
                        roomId: roomsEntity.id,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
