import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/features/internal_tour/presentation/cubit/tour_cubit.dart';
import 'package:safarni/features/internal_tour/presentation/cubit/tour_state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 25,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search tours...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (query) {
                  context.read<TourCubit>().fetchTours(searchQuery: query);
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<TourCubit, TourState>(
                builder: (context, state) {
                  if (state is TourLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is TourLoaded) {
                    final tours = state.tours;
                    if (tours.isEmpty)
                      return const Center(child: Text("No tours found"));
                    return ListView.builder(
                      itemCount: tours.length,
                      itemBuilder: (context, index) {
                        final tour = tours[index];
                        return ListTile(
                          leading: Image.network(
                            tour.image,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                          title: Text(tour.title),
                          subtitle: Text("\$${tour.price}"),
                        );
                      },
                    );
                  } else if (state is TourError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
