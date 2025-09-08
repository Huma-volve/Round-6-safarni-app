import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/utils/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(backgroundColor: AppColors.white,
          body: Center(child: Text("Hello World",style: AppStyles.viewAllStyle,),),),
         // theme: ThemeData(fontFamily: "Poppins"),
        );
      },
    );
  }
}

