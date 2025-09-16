import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/features/my_bookings/data/repositories/my_booking_repositories_impl.dart';
import 'package:safarni/features/my_bookings/domain/user_cases/get_car.dart';
import 'package:safarni/features/my_bookings/domain/user_cases/get_flight.dart';
import 'package:safarni/features/my_bookings/domain/user_cases/get_hotel.dart';
import 'package:safarni/features/my_bookings/domain/user_cases/get_tour.dart';
import 'package:safarni/features/my_bookings/presentation/cubit/my_booking_cubit.dart';
import 'package:safarni/features/my_bookings/presentation/widgets/custom_car_tab.dart';
import 'package:safarni/features/my_bookings/presentation/widgets/custom_flight_tab.dart';
import 'package:safarni/features/my_bookings/presentation/widgets/custom_hotel_tab.dart';
import 'package:safarni/features/my_bookings/presentation/widgets/custom_tab.dart';
import 'package:safarni/features/my_bookings/presentation/widgets/custom_tours_tab.dart';
class MyBookingView extends StatelessWidget {
  const MyBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingsCubit(
        getFlights: GetFlights(BookingRepositoryImpl(Dio())),
        getCars: GetCars(BookingRepositoryImpl(Dio())),
       getTours: GetTours(BookingRepositoryImpl(Dio())),
         getHotels: GetHotels(BookingRepositoryImpl(Dio())),
      )..loadAll(),
      child:DefaultTabController(
      length: 4,
      child: Scaffold(
             backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
          title: const Text('My Booking'),

          bottom: PreferredSize(
            preferredSize:const Size(436, 42),
            child: Container(
              width: 436,
              height: 42,
              padding: EdgeInsets.zero,
              child: TabBar(
                isScrollable: true,
                dividerColor: Colors.white,
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 0,
                ),
                labelColor: const Color(0xFF1A56DB),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFEBF5FF),
                ),
              tabs: const[
                  CustomTabItem(icon: Icons.flight, label: 'Flights'),
                  CustomTabItem(icon: Icons.directions_car, label: 'car'),
                  CustomTabItem(icon: Icons.tour, label: 'Tours'),
                  CustomTabItem(icon: Icons.hotel, label: 'Hotel'),
              ],
            ),
          ),
          ),
        ),
      
          body: BlocBuilder<BookingsCubit, BookingsState>(
            builder: (context, state) {
              if (state is BookingsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is BookingsLoaded) {
                return TabBarView(
                  children: [
                    FlightTab(flights: state.flights),
                     CarsTab(cars: state.cars,),
                    ToursTab(tours: state.tours),
                     HotelTab(hotels: state.hotels),
                  ],
                );
              } else if (state is BookingsError) {
                return Center(child: Text("Error: ${state.message}"));
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}





