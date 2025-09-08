import 'package:flutter/material.dart';
import 'package:safarni/features/internal_tour/presentation/views/screens/internal_tour_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/features/onboarding/presentation/view/onboarding_view.dart';

import 'package:safarni/core/utils/on_generate_routes.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/hotel_booking_view.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/widgets/custom_bottom_nav_bar.dart';


void main() {
  runApp(const SafarniApp());
}

class SafarniApp extends StatelessWidget {
  const SafarniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SearchPage(),
    );
  }
}
   

  





