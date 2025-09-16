import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_images.dart';
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
                  child: tour.image != null
                      ? Image.network(
                          tour.image!,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        )
                      : 
                  
                   Image.asset(AppImages.myToursBooking,
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
                        tour.description?? 'Full Day Tour',
                        style:const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                       Text(
                        tour.title??'Eiffel Tower'
                        ,
                        style:const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'From ',
                          style:const TextStyle(fontSize: 14, color: Colors.grey),
                          children: [
                            TextSpan(
                              text: tour.price ?? '230',
                              style:const TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          const  TextSpan(
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
                 Column(
                  children: [
                   const Icon(Icons.star, color: Colors.amber, size: 20),
                   const SizedBox(height: 4),
                    Text(
                      tour.rating.toString(),
                      style:const TextStyle(
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
