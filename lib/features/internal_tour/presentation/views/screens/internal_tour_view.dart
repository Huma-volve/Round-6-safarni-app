import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/features/internal_tour/presentation/views/widgets/custom_list_view.dart';
import 'package:safarni/features/internal_tour/presentation/views/widgets/custom_search_widget.dart';

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
              child: SearchTextField(
                onChanged: (value) {
                  debugPrint("User searched: $value");
                },
              ),
            ),
            const Expanded(child: ToursScreen()),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
