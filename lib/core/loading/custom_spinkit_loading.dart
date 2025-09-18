import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomSpinkitLoading extends StatefulWidget {
  const CustomSpinkitLoading({super.key});

  @override
  State<CustomSpinkitLoading> createState() => _CustomSpinkitLoadingState();
}

class _CustomSpinkitLoadingState extends State<CustomSpinkitLoading>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),

      child: const Center(
        child: SpinKitFadingCircle(color: Colors.black, size: 40.0),
      ),
    );
  }
}
