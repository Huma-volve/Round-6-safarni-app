import 'package:flutter/material.dart';
import 'package:safarni/features/internal_tour/domain/entites/internal_entity.dart';
import 'package:safarni/features/internal_tour/presentation/views/widgets/custom_card.dart';

class ToursScreen extends StatefulWidget {
  final List<Tour> tours;
  const ToursScreen({super.key, required this.tours});

  @override
  State<ToursScreen> createState() => _ToursScreenState();
}

class _ToursScreenState extends State<ToursScreen> {
  late List<Tour> filteredTours;

  @override
  void initState() {
    super.initState();
    filteredTours = widget.tours;
  }

  void filterTours(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTours = widget.tours;
      } else {
        filteredTours = widget.tours
            .where(
              (tour) => tour.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: "Search tours...",
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: filterTours,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredTours.length,
            itemBuilder: (context, index) {
              final tour = filteredTours[index];
              return CustomCard(tour: tour);
            },
          ),
        ),
      ],
    );
  }
}
