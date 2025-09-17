import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/features/internal_tour/presentation/cubit/tour_cubit.dart';
import 'package:safarni/features/internal_tour/presentation/cubit/tour_state.dart';
import 'package:safarni/features/internal_tour/presentation/views/widgets/custom_card.dart';
import 'package:safarni/features/internal_tour/presentation/views/widgets/custom_search_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: SearchTextField(
                onSearch: (query) {
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
                    if (tours.isEmpty) {
                      return const Center(
                        child: Text(
                          "No tours found",
                          style: TextStyle(
                            color: AppColors.grey500,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: tours.length,
                      itemBuilder: (context, index) {
                        final tour = tours[index];
                        return CustomCard(tour: tour);
                      },
                    );
                  } else if (state is TourError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
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
