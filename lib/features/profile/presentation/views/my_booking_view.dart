import 'package:flutter/material.dart';

class MyBookingView extends StatelessWidget {
  const MyBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Booking'),
          bottom: const TabBar(
            tabs: [
              // Tab(
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Icon(Icons.flight),
              //       SizedBox(width: 8),
              //       Text("Flight"),
              //     ],
              //   ),
              // ),
              Tab(icon: Icon(Icons.flight), text: 'Flight'),
              Tab(icon: Icon(Icons.directions_car), text: 'Cars'),
              Tab(icon: Icon(Icons.tour), text: 'Tours'),
              Tab(icon: Icon(Icons.hotel), text: 'Hotel'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [FlightTab(), CarsTab(), ToursTab(), HotelTab()],
        ),
      ),
    );
  }
}

class FlightTab extends StatelessWidget {
  const FlightTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5, 
      itemBuilder: (context, index) {
        return  const Card(
          margin: EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Flight',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('December 15th, 2022'),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('07h05'),
                    Icon(Icons.flight_takeoff),
                    Text('20h05'),
                  ],
                ),
                SizedBox(height: 8),
                Text('YUL -> NRT'),
                SizedBox(height: 8),
                Text('Gate: 6 | Terminal: 3 | Flight: AC006'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CarsTab extends StatelessWidget {
  const CarsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5, // عدد البطاقات
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network('https://via.placeholder.com/150', height: 100),
                const SizedBox(height: 8),
                Text(
                  'Car ${index + 1}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('Automatic | 5 seats | Diesel'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ToursTab extends StatelessWidget {
  const ToursTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5, // عدد البطاقات
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network('https://via.placeholder.com/150', height: 100),
                const SizedBox(height: 8),
                Text(
                  'Tour ${index + 1}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('From 230\$ Per Person'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HotelTab extends StatelessWidget {
  const HotelTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5, // عدد البطاقات
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network('https://via.placeholder.com/150', height: 100),
                const SizedBox(height: 8),
                Text(
                  'Hotel ${index + 1}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('New York, USA'),
              ],
            ),
          ),
        );
      },
    );
  }
}
