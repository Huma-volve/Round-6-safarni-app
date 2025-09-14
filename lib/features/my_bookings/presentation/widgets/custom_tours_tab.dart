import 'package:flutter/material.dart';
import 'package:safarni/features/my_bookings/domain/entities/tour_booking.dart';

class ToursTab extends StatelessWidget {
  List<TourBooking> tours;
   ToursTab({super.key,required this.tours});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding:  EdgeInsets.all(16),
      itemCount: tours.length,
      itemBuilder: (context, index) {
        final tour = tours[index];

        return Card(
                    color: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/images/tour.jpg',
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(
                        tour.description,
                        style:const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                       Text(
                        tour.title
                        ,
                        style:const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: const TextSpan(
                          text: 'From ',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                          children: [
                            TextSpan(
                              text: '230\$',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' Per Person',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Column(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(height: 4),
                    Text(
                      '4.5',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
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
