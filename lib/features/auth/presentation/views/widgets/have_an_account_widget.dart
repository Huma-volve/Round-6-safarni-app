import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constant/app_style.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
    required this.tex1,
    required this.text2,
    this.onTap,
  });
  final String tex1, text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: tex1, style: AppStyle.poppins14px500WGray800),
              TextSpan(text: text2, style: AppStyle.poppins14px500WGray800),
            ],
          ),
        ),
      ),
    );
  }
}
