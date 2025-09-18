import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/fligth_booking/presentation/cubit/flight_cubit.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/custom_button_flight_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/date_container_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/fligth_container.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/fligth_image_widget.dart';

class SelectFlightView extends StatefulWidget {
  const SelectFlightView({
    required this.from,
    required this.to,
    required this.date,
    super.key,
  });
  final String from;
  final String to;
  final String date;

  @override
  State<SelectFlightView> createState() => _SelectFlightViewState();
}

class _SelectFlightViewState extends State<SelectFlightView> {
  @override
  void initState() {
    super.initState();
    context.read<FlightCubit>().fetchFlights(
      from: widget.from,
      to: widget.to,
      date: widget.date,
    );
  }

  String formatTime(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    return DateFormat('h:mm a').format(dateTime);
  }

  String extractMonth(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    return DateFormat('MMM').format(dateTime);
  }

  int? id;
  int? price;
  String? startTime;
  String? endTime;
  String? month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: BlocBuilder<FlightCubit, FlightState>(
          builder: (context, state) {
            if (state is FlightLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FlightLoaded) {
              if (state.flights.isEmpty) {
                return const Center(child: Text('No flights found'));
              }
              return Column(
                children: [
                  const FlightImageWidget(text: 'Select Your Flight'),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: DateContainerWidget(
                          text: 'Dec 16th, 2025',
                          icon: AppIcons.calendarDaysIcon,
                          margin: EdgeInsets.only(left: 16, top: 16, right: 4),
                        ),
                      ),
                      Flexible(
                        child: DateContainerWidget(
                          text: 'Jan 6th,2025',
                          icon: AppIcons.userIcon,
                          margin: EdgeInsets.only(right: 16, top: 16, left: 4),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpace(height: 16),

                  ...state.flights.map((flight) {
                    return SubtractShape(
                      onTap: () {
                        setState(() {
                          id = flight.id;
                          price = flight.price;
                          startTime = formatTime(flight.departureTime);
                          endTime = formatTime(flight.arrivalTime);
                          month = extractMonth(flight.departureTime);

                          print(id);
                        });
                      },
                      time: '13:00',
                      startTime: formatTime(flight.departureTime),
                      endTime: formatTime(flight.arrivalTime),
                      month: extractMonth(flight.departureTime),
                      place: flight.to,
                      price: '\$${flight.price}',
                      layover: '1 layover: YYZ (3:55)',
                    );
                  }).toList(),
                  CutomButtonFligthWidget(
                    text: 'continue',
                    margin: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    onTap: () {
                      if (id != null) {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.chooseSeatsRouteName,
                          arguments: {
                            'id': id,
                            'price': price,
                            'startTime': startTime,
                            'endTime': endTime,
                            'month': month,
                            'date': widget.date,
                          },
                        );
                        print('id: ');
                        print(id);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a flight first'),
                          ),
                        );
                      }
                    },
                  ),
                ],
              );
            } else if (state is FlightError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Text('⚠️ Unexpected state: $state');
          },
        ),
      ),
    );
  }
}
