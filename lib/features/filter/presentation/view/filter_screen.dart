import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/widgets/custom_text_field.dart';
import 'package:safarni/core/widgets/spacing.dart';
import 'package:safarni/features/filter/presentation/widgets/custom_rounded_container.dart';
import '../../../../core/constants/app_styles.dart';
import '../widgets/budget_curve_painter.dart';

class FilterScreen extends StatefulWidget {
  final String? selectedLocation;

  const FilterScreen({super.key, this.selectedLocation = 'Paris'});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int? selectedIndex = -1;
  RangeValues _budgetRange = const RangeValues(0.0, 100.0);
  final List<String> _selectedAdventureStyles = [];
  final List<int> _selectedRatings = [];
  final TextEditingController _locationController = TextEditingController();

  final List<String> filters = [
    'Price (Low to High)',
    'Price (High to Low)',
    'Biggest Deals (Highest Saving)',
    'Most Reviewed',
    'Most Popular',
  ];

  final List<Map<String, dynamic>> _adventureStyles = [
    {'title': 'Adventure Travel', 'icon': Icons.terrain},
    {'title': 'City Breaks', 'icon': Icons.location_city},
    {'title': 'Water Activity', 'icon': Icons.waves},
    {'title': 'Road Trips', 'icon': Icons.directions_car},
  ];

  @override
  void initState() {
    super.initState();
    _locationController.text = '';
  }

  Widget buildFilter(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      highlightColor: AppColors.containerRounded,
      splashColor: AppColors.containerRounded,
      borderRadius: BorderRadius.circular(38.r),
      child: CustomRoundedContainer(
        text: filters[index],
        isSelected: selectedIndex == index,
      ),
    );
  }

  Widget _buildBudgetRangeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Budget Range', style: AppStyles.addressesTextStyle),
        const HeightSpace(height: 24),
        Container(
          height: 120.h,
          margin: EdgeInsets.only(right: 20.w),
          child: Stack(
            children: [
              SizedBox(
                height: 80.h,
                child: CustomPaint(
                  size: Size(double.infinity, 80.h),
                  painter: BudgetCurvePainter(),
                ),
              ),
              // Range slider
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: Colors.blue.shade600,
                    inactiveTrackColor: Colors.grey.shade300,
                    thumbColor: Colors.blue.shade600,
                    overlayColor: Colors.blue.shade100,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.r),
                    trackHeight: 3.h,
                  ),
                  child: RangeSlider(
                    values: _budgetRange,
                    max: 8500,
                    onChanged: (RangeValues values) {
                      setState(() {
                        _budgetRange = values;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const HeightSpace(height: 8),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Min',
                    style: TextStyle(fontSize: 12.sp, color: AppColors.grey600),
                  ),
                  Text(
                    '\$${_budgetRange.start.round()}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey900,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Max',
                    style: TextStyle(fontSize: 12.sp, color: AppColors.grey600),
                  ),
                  Text(
                    '\$${_budgetRange.end.round()}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey900,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAdventureStyleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Adventure Style', style: AppStyles.addressesTextStyle),
            const WidthSpace(width: 8),
            Text(
              'Multi Select',
              style: TextStyle(fontSize: 12.sp, color: AppColors.grey600),
            ),
          ],
        ),
        const HeightSpace(height: 16),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 3.5,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            children: _adventureStyles.map((style) {
              final bool isSelected = _selectedAdventureStyles.contains(
                style['title'],
              );
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      _selectedAdventureStyles.remove(style['title']);
                    } else {
                      _selectedAdventureStyles.add(style['title']);
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.containerRounded
                        : AppColors.white,
                    border: Border.all(
                      color: isSelected
                          ? AppColors.containerRounded
                          : AppColors.grey200,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        style['icon'],
                        size: 18.sp,
                        color: isSelected
                            ? AppColors.priceColor
                            : AppColors.grey500,
                      ),
                      const WidthSpace(width: 8),
                      Expanded(
                        child: Text(
                          style['title'],
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: isSelected
                                ? AppColors.priceColor
                                : AppColors.grey600,
                            fontWeight: isSelected
                                ? FontWeight.w500
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Location', style: AppStyles.addressesTextStyle),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Icon(
                Icons.map_outlined,
                color: Colors.blue.shade600,
                size: 20.sp,
              ),
            ),
          ],
        ),
        const HeightSpace(height: 16),
        Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * .1,
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _locationController,
                  isEnabled: false,
                ),
              ),
            ],
          ),
        ),
        const HeightSpace(height: 12),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: AppColors.grey200,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.close, size: 14.sp, color: AppColors.grey600),
              const WidthSpace(width: 4),
              Text(
                widget.selectedLocation ?? 'Egypt',
                style: TextStyle(fontSize: 12.sp, color: AppColors.grey600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Rating', style: AppStyles.addressesTextStyle),
            const WidthSpace(width: 8),
            Text(
              'Multi Select',
              style: TextStyle(fontSize: 12.sp, color: AppColors.grey500),
            ),
          ],
        ),
        const HeightSpace(height: 16),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Wrap(
            spacing: 25.w,
            runSpacing: 12.h,
            children: List.generate(5, (index) {
              final int rating = index + 1;
              final bool isSelected = _selectedRatings.contains(rating);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      _selectedRatings.remove(rating);
                    } else {
                      _selectedRatings.add(rating);
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.containerRounded
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(38.r),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.containerRounded
                          : AppColors.grey200,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star_border,
                        color: isSelected
                            ? AppColors.priceColor
                            : AppColors.grey500,
                        size: 20.sp,
                      ),
                      const WidthSpace(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: isSelected
                              ? AppColors.priceColor
                              : AppColors.grey400,
                          fontWeight: isSelected
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  _budgetRange = const RangeValues(40.0, 80.0);
                  _selectedAdventureStyles.clear();
                  _selectedRatings.clear();
                  _locationController.clear();
                  selectedIndex = -1;
                });
              },
              child: Text(
                'Clear All',
                style: TextStyle(
                  color: Colors.blue.shade600,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const WidthSpace(width: 16),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.resultSearchScreen);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'Go to Tours Found',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text('Filter', style: AppStyles.addressesTextStyle),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.grey900,
            size: 24.sp,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeightSpace(height: 24),
                    Text('Sort By', style: AppStyles.addressesTextStyle),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.0.w,
                            top: 10.h,
                            bottom: 16.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  buildFilter(0),
                                  WidthSpace(width: width * .05),
                                  buildFilter(1),
                                ],
                              ),
                              const HeightSpace(height: 16),
                              buildFilter(2),
                              const HeightSpace(height: 16),
                              Row(
                                children: [
                                  buildFilter(3),
                                  const WidthSpace(width: 12),
                                  buildFilter(4),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const HeightSpace(height: 16),
                    const Divider(
                      thickness: 1,
                      color: AppColors.grey200,
                      endIndent: 20,
                    ),
                    const HeightSpace(height: 24),
                    _buildBudgetRangeSection(),
                    const HeightSpace(height: 32),
                    const Divider(
                      thickness: 1,
                      color: AppColors.grey200,
                      endIndent: 20,
                    ),
                    const HeightSpace(height: 16),
                    _buildAdventureStyleSection(),
                    const HeightSpace(height: 20),
                    const Divider(
                      thickness: 1,
                      color: AppColors.grey200,
                      endIndent: 20,
                    ),
                    const HeightSpace(height: 16),
                    _buildLocationSection(),
                    const HeightSpace(height: 10),
                    const Divider(
                      thickness: 1,
                      color: AppColors.grey200,
                      endIndent: 20,
                    ),
                    const HeightSpace(height: 10),
                    _buildRatingSection(),
                    const HeightSpace(height: 40),
                  ],
                ),
              ),
            ),
          ),
          _buildBottomButtons(),
        ],
      ),
    );
  }
}
