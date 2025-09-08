import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/features/auth/presentation/views/get_started_view.dart';
import 'package:safarni/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:safarni/features/onboarding/presentation/view/onboarding_view.dart';

void main() {
  runApp(const SafarniApp());
}

class SafarniApp extends StatelessWidget {
  const SafarniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetStartedView(),
      ),
    );
  }
}
