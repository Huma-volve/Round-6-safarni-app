import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/compare/presentation/views/widgets/custom_compre_list_view.dart';
import 'package:safarni/features/compare/presentation/views/widgets/custom_material_buttom_widget.dart';
import 'package:safarni/features/compare/presentation/views/widgets/custom_sliver_details.dart';
import 'package:safarni/features/internal_tour/presentation/views/widgets/custom_search_widget.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({super.key});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: SearchTextField(
                  //   onChanged: (value) {
                  //     debugPrint("User searched: $value");
                  //   },
                  // ),
                ),
              ),
              CustomCompreListView(),
              SliverToBoxAdapter(
                child: Text(
                  "Compare",
                  style: AppStyles.poppins16px600WPrimayColor.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),

              CustomSliverDetails(
                selectedIndex: selectedIndex,
                onSelect: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: CustomMaterialButtomWidget(
                    text: "Check Out",
                    isEnabled: selectedIndex != null,
                    onPressed: () {
                      if (selectedIndex != null) {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.paymentRouteName,
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
