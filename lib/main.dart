import 'package:flutter/material.dart';
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
      home: const CustomBottomNavBar(),
    );
  }
}
   

  





