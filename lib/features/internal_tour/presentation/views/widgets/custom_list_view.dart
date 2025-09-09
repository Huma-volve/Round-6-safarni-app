import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/features/internal_tour/presentation/views/widgets/custom_card.dart';

import '../../../../../core/constants/app_images.dart';

class ToursScreen extends StatefulWidget {
  const ToursScreen({super.key});

  @override
  State<ToursScreen> createState() => _ToursScreenState();
}

class _ToursScreenState extends State<ToursScreen> {
  List<Tour> allTours = [
    Tour(
      name: "Eiffel Tower",
      image: AppImages.homePyramidPhoto,
      price: 230,
      rating: 4.5,
      type: "Full Day Tour",
    ),
    Tour(
      name: "Notre-Dame Cathedral",
      image: AppImages.homePyramidPhoto,
      price: 250,
      rating: 4.5,
      type: "Full Day Tour",
    ),
    Tour(
      name: "Louvre Museum",
      image: AppImages.homeCitadelPhoto,
      price: 150,
      rating: 4.5,
      type: "Full Day Tour",
    ),
    Tour(
      name: "Louvre Museum",
      image: AppImages.dahabPhoto,
      price: 150,
      rating: 4.5,
      type: "Full Day Tour",
    ),
    Tour(
      name: "Louvre Museum",
      image: AppImages.homeCitadelPhoto,
      price: 150,
      rating: 4.5,
      type: "Full Day Tour",
    ),
  ];

  List<Tour> filteredTours = [];

  @override
  void initState() {
    super.initState();
    filteredTours = allTours;
  }

  void filterTours(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTours = allTours;
      } else {
        filteredTours = allTours
            .where(
              (tour) => tour.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredTours.length,
              itemBuilder: (context, index) {
                final tours = filteredTours[index];
                return CustomCard(tour: tours);
              },
            ),
          ),
        ],
      ),
    );
  }
}
