import 'package:flutter/material.dart';

class FlightTab extends StatelessWidget {
  const FlightTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 2, // عدد البطاقات
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 16),
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.flight, color: Colors.white),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Air Canada',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'December 16th, 2022',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '07h05',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.flight_takeoff, color: Colors.blue),
                    Text(
                      '20h05',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'YUL',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      '13h00',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'NRT',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Divider(height: 24, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gate: 8',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'Seat: 6',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'Terminal: 3',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'Flight: AC006',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
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
