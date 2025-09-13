import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_images.dart';

class CarAnimation extends StatefulWidget {
  const CarAnimation({super.key});

  @override
  State<CarAnimation> createState() => _CarAnimationState();
}

class _CarAnimationState extends State<CarAnimation> {
  double angile = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(AppImages.rectangle),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    angile -= 0.1;
                  });
                },
                child: SvgPicture.asset(AppIcons.arrow),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: Transform.rotate(
                  angle: angile,
                  child: Image.asset(
                    AppImages.type_car_2,
                    width: 300,
                    height: 250,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    angile += 0.1;
                  });
                },
                child: Image.asset(AppIcons.ArrowRight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
