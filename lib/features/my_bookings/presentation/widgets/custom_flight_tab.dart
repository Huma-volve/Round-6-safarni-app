import 'package:flutter/material.dart';
import 'package:safarni/features/my_bookings/domain/entities/flight_booking.dart';

class FlightTab extends StatelessWidget {
  List<FlightBooking>  flights;
  FlightTab({super.key,required this.flights});
  

  @override
  Widget build(BuildContext context) {
     if (flights.isEmpty) {
      return const Center(child:const Text("No flights available"));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: flights.length, 
      itemBuilder: (context, index) {
        final flight = flights[index];
        return Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 16),
          child:  Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                      const  CircleAvatar(
                        radius: 15,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.flight, color: Colors.white,size: 20),
                        ),
                      const  SizedBox(height: 8),
                        Text(
                          flight.airline,
                          style:const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      flight.date,
                      style:const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              const  SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      flight.departureTime,
                      style:const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   const Icon(Icons.flight_takeoff, color: Colors.blue),
                    Text(
                      flight.arrivalTime,
                      style:const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
               const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      flight.from,
                      style:const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      flight.arrivalTime,
                      style:const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      flight.to,
                      style:const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
               const Divider(height: 24, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gate: ${flight.gate}',
                      style:const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'Seat: ${flight.seat}',
                      style:const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'Terminal: ${flight.terminal}',
                      style:const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'Flight: ${flight.flightNo}',
                      style:const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}




