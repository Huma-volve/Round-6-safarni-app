import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/fligth_booking/presentation/cubit/flight_cubit.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/color_container_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/custom_button_flight_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/row_text_of_price_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/seat_number_container_widget.dart';

class ChooseSeatsView extends StatefulWidget {
  const ChooseSeatsView({
    required this.date,
    required this.id,
    required this.price,
    required this.startTime,
    required this.endTime,
    required this.month,
    super.key,
  });
  final int id;
  final int price;
  final String startTime;
  final String endTime;
  final String month;
  final String date;

  @override
  State<ChooseSeatsView> createState() => _ChooseSeatsViewState();
}

class _ChooseSeatsViewState extends State<ChooseSeatsView> {
  @override
  void initState() {
    super.initState();
    context.read<FlightCubit>().fetchSeats(widget.id);
  }

  int? seatId;
  int? seatNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.grey900),
        ),
        backgroundColor: AppColors.white,
        title: Text(
          'choose Seats',
          style: AppStyles.font14Meduim.copyWith(
            fontSize: 18,
            color: AppColors.grey900,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.white,
      body: BlocBuilder<FlightCubit, FlightState>(
        builder: (context, state) {
          if (state is SeatsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SeatsLoaded) {
            final seats = state.seats;
            final List<dynamic> seatsWithGaps = [];
            for (int i = 0; i < seats.length; i++) {
              if (i % 5 == 2) {
                seatsWithGaps.add(
                  null,
                ); //انا عاملة دي علشان اسيب مسافة فاضية بعد اول اتنين زي design
              }
              seatsWithGaps.add(seats[i]);
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ColorContainerWidget(
                        color: AppColors.blue700Color,
                        text: 'Available',
                      ),
                      ColorContainerWidget(
                        color: Color(0xff03D947),
                        text: 'Selected',
                      ),
                      ColorContainerWidget(
                        color: Color(0xffD1D5DB),
                        text: 'Un available',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      itemCount: seatsWithGaps.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                      itemBuilder: (context, index) {
                        final seat = seatsWithGaps[index];

                        if (seat == null) {
                          // ده فراغ
                          return const SizedBox.shrink();
                        }

                        return GestureDetector(
                          onTap: () {
                            if (seat.status == 'available') {
                              setState(() {
                                seatId = seat.id;
                                seatNumber = seat.seatNumber;
                              });
                            }
                          },
                          child: SeatNumberContainerWidget(
                            number: seat.seatNumber,
                            color: seat.id == seatId
                                ? const Color(0xff03D947)
                                : seat.status == 'available'
                                ? AppColors.blue700Color
                                : AppColors.gray200,
                            textColor: seat.status == 'available'
                                ? AppColors.white
                                : AppColors.gray900,
                          ),
                        );
                      },
                    ),
                  ),
                  const VerticalSpace(height: 6),
                  RowTextOfPriceWidget(
                    title: 'Ticket price',
                    price: '\$ ${widget.price}.00',
                  ),
                  RowTextOfPriceWidget(
                    title: 'Total Price',
                    price: '\$ ${widget.price}.00',
                  ),
                  RowTextOfPriceWidget(
                    title: 'your Seat',
                    price: '$seatNumber',
                  ),
                  CutomButtonFligthWidget(
                    text: 'continue',
                    margin: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 16,
                    ),
                    onTap: () async {
                      context.read<FlightCubit>().bookFlight(
                        flightId: widget.id,
                        seatId: seatId ?? 0,
                      );
                      if (seatNumber != null) {
                        await Navigator.pushNamed(
                          context,
                          AppRoutes.boardingPassRouteName,
                          arguments: {
                            'startTime': widget.startTime,
                            'endTime': widget.endTime,
                            'month': widget.month,
                            'seatNumber': seatNumber,
                            'date': widget.date,
                            'bookingId': widget.id,
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please choose seat number'),
                          ),
                        );
                      }
                      context.read<FlightCubit>().fetchSeats(widget.id);
                    },
                  ),
                ],
              ),
            );
          } else if (state is SeatsError) {
            return Center(
              child: Center(child: Text('Error: ${state.message}')),
            );
          }
          return const Center(child: Center(child: Text('No seats data')));
        },
      ),
    );
  }
}
