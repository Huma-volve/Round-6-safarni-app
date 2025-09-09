import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/spacing.dart';
import 'package:safarni/features/home/presentation/widgets/custom_card_search.dart';
import '../../../../core/constants/app_colors.dart';

class ResultOfSearchScreen extends StatelessWidget {
  final String title;
  const ResultOfSearchScreen({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    final List<Map<String,dynamic>> tours = [
      {
        "image":
        "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=800&q=80",
        "title": "Double Dreams in Paris",
        "rating": 4.5,
        "reviews": 650,
        "pickup": "Pickup Available",
        "days": "5 Days",
        "price": "1050\$"
      },
      {
        "image":
        "https://images.unsplash.com/photo-1505761671935-60b3a7427bad?auto=format&fit=crop&w=800&q=80",
        "title": "Paris City Tour",
        "rating": 4.1,
        "reviews": 2750,
        "pickup": "Pickup Available",
        "days": "7 Days",
        "price": "1500\$"
      },
      {
        "image":
        "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80",
        "title": "Venice Boat Tour",
        "rating": 4.7,
        "reviews": 1240,
        "pickup": "Pickup Available",
        "days": "3 Days",
        "price": "890\$"
      },
      {
        "image":
        "https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?auto=format&fit=crop&w=800&q=80",
        "title": "Bangkok Nightlife",
        "rating": 4.6,
        "reviews": 980,
        "pickup": "Pickup Available",
        "days": "4 Days",
        "price": "1150\$"
      },
      {
        "image":
        "https://images.unsplash.com/photo-1528909514045-2fa4ac7a08ba?auto=format&fit=crop&w=800&q=80",
        "title": "Tokyo Highlights",
        "rating": 4.9,
        "reviews": 3120,
        "pickup": "Pickup Available",
        "days": "6 Days",
        "price": "2100\$"
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.grey900,
            size: 24.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
            CupertinoIcons.search,
            color: AppColors.grey900,
            size: 24.sp,
          ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
            Icons.edit_note_outlined,
            color: AppColors.grey900,
            size: 24.sp,
          ),
          ),
        ],
      ),
      body: Column(
        children: [
          HeightSpace(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(title,style: AppStyles.townName,),
                WidthSpace(width: 7),
                Text(" ${tours.length} Results", style: AppStyles.bottomNavTitle.copyWith(fontSize: 15.sp),)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: tours.length,
              itemBuilder: (context, index) {
                final tour = tours[index];
                return CustomCardSearch(
                  imageUrl: tour["image"] as String,
                  title: tour["title"] as String,
                  rating: tour["rating"] as double,
                  reviews: tour["reviews"] as int,
                  pickup: tour["pickup"] as String,
                  days: tour["days"] as String,
                  price: tour["price"] as String,
                  delay: index * 200,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
