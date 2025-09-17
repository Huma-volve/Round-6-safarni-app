import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/widgets/custom_divider.dart';
import 'package:safarni/features/rooms/details/data/model/age_model.dart';
import 'package:safarni/features/rooms/details/domain/entity/my_room_booking_entity.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/my_room_booking/my_room_booking_cubit.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_age_list_tile.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_button.dart';

class CustomContinueButton extends StatefulWidget {
  const CustomContinueButton({
    required this.checkIn,
    required this.checkOut,
    required this.roomId,
    required this.primeContext,
    required this.cubitContext,
    super.key,
  });
  final String checkIn, checkOut;
  final int roomId;
  final BuildContext primeContext, cubitContext;

  @override
  State<CustomContinueButton> createState() => _CustomContinueButtonState();
}

class _CustomContinueButtonState extends State<CustomContinueButton> {
  int count1 = 0, count2 = 0, count3 = 0;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .14,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0xFFD1D5DB),
            blurRadius: 20,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: CustomButton(
            title: 'Continue',
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, localSetState) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomAgeListTile(
                                  onChanged: (value) {
                                    localSetState(() {
                                      count1 = value;
                                    });
                                  },
                                  title: AgeModel.ageList[0].title,
                                  subTitle: AgeModel.ageList[0].subTitle,
                                ),
                                const SizedBox(height: 16),
                                const CustomDivider(),
                                const SizedBox(height: 16),
                                CustomAgeListTile(
                                  onChanged: (value) {
                                    localSetState(() {
                                      count2 = value;
                                    });
                                  },
                                  title: AgeModel.ageList[1].title,
                                  subTitle: AgeModel.ageList[1].subTitle,
                                ),
                                const SizedBox(height: 16),
                                const CustomDivider(),
                                const SizedBox(height: 16),
                                CustomAgeListTile(
                                  onChanged: (value) {
                                    localSetState(() {
                                      count3 = value;
                                    });
                                  },
                                  title: AgeModel.ageList[2].title,
                                  subTitle: AgeModel.ageList[2].subTitle,
                                ),
                                const SizedBox(height: 16),
                                const CustomDivider(),
                                const SizedBox(height: 16),
                                CustomButton(
                                  title: 'Check Out',
                                  onPressed: () {
                                    final int totalCount =
                                        count1 + count2 + count3;
                                    if (totalCount != 0) {
                                      setState(() {
                                        errorMessage = null;
                                      });
                                      widget.cubitContext
                                          .read<MyRoomBookingCubit>()
                                          .addRoomBooking(
                                            roomBooking: MyRoomBookingEntity(
                                              adultsCount: count1,
                                              childrenCount: count2,
                                              infantsCount: count3,
                                              checkInDate: widget.checkIn,
                                              checkOutDate: widget.checkOut,
                                              roomId: widget.roomId,
                                            ),
                                          );
                                      Navigator.pop(context);
                                    } else {
                                      localSetState(() {
                                        errorMessage = 'Please select age ';
                                      });
                                      Future.delayed(
                                        const Duration(seconds: 2),
                                        () {
                                          if (mounted) {
                                            localSetState(() {
                                              errorMessage = null;
                                            });
                                          }
                                        },
                                      );
                                      log('error');
                                    }
                                  },
                                  width: double.infinity,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * .05,
                                ),
                              ],
                            ),
                          ),

                          if (errorMessage != null)
                            Positioned(
                              bottom: MediaQuery.sizeOf(context).height * .11,
                              left: 30,
                              right: 30,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,

                                  borderRadius: BorderRadius.circular(12),
                                ),

                                child: Text(
                                  errorMessage!,
                                  style: const TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  );
                },
              );
            },
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
