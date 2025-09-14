import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_styles.dart';

class SubtractShape extends StatelessWidget {
  const SubtractShape({
    required this.startTime,
    required this.endTime,
    required this.month,
    required this.time,
    required this.place,
    required this.price,
    super.key,
    this.layover,
  });
  final String startTime;
  final String endTime;
  final String month;
  final String time;
  final String? layover;
  final String place;
  final String price;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 135,
      child: CustomPaint(
        painter: RPSCustomPainter(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    startTime,
                    style: AppStyles.font14Meduim.copyWith(
                      fontSize: 15,
                      color: AppColors.grey900,
                    ),
                  ),
                  SvgPicture.asset(AppIcons.planeIcon),
                  Text(
                    endTime,
                    style: AppStyles.font14Meduim.copyWith(
                      fontSize: 15,
                      color: AppColors.grey900,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    month,
                    style: AppStyles.font14Meduim.copyWith(
                      fontSize: 15,
                      color: AppColors.grey500Color,
                    ),
                  ),
                  Text(
                    time,
                    style: AppStyles.font14Meduim.copyWith(
                      fontSize: 15,
                      color: AppColors.grey500Color,
                    ),
                  ),
                  Text(
                    month,
                    style: AppStyles.font14Meduim.copyWith(
                      fontSize: 15,
                      color: AppColors.grey500Color,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 3,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    layover ?? '',
                    style: AppStyles.font15Regular.copyWith(
                      fontSize: 11,
                      color: AppColors.grey500Color,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    place,
                    style: AppStyles.font14Meduim.copyWith(
                      fontSize: 15,
                      color: AppColors.grey900,
                    ),
                  ),
                  Text(
                    price,
                    style: AppStyles.font14Meduim.copyWith(
                      fontSize: 15,
                      color: AppColors.grey900,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(1);
    final Path path_0 = Path();
    path_0.moveTo(19.4336, 0.25);
    path_0.lineTo(323.566, 0.25);
    path_0.cubicTo(334.152, 0.25, 342.75, 9.15851, 342.75, 20.167);
    path_0.lineTo(342.75, 54.2031);
    path_0.cubicTo(334.669, 54.3416, 328.175, 61.179, 328.175, 69.5752);
    path_0.cubicTo(328.175, 77.9713, 334.669, 84.8078, 342.75, 84.9463);
    path_0.lineTo(342.75, 100.833);
    path_0.cubicTo(342.75, 111.841, 334.152, 120.75, 323.566, 120.75);
    path_0.lineTo(19.4336, 120.75);
    path_0.cubicTo(8.84753, 120.75, 0.25, 111.841, 0.25, 100.833);
    path_0.lineTo(0.25, 84.9463);
    path_0.cubicTo(8.3306, 84.8078, 14.8251, 77.9713, 14.8252, 69.5752);
    path_0.cubicTo(14.8252, 61.179, 8.33067, 54.3416, 0.25, 54.2031);
    path_0.lineTo(0.25, 20.167);
    path_0.cubicTo(0.25, 9.15851, 8.84753, 0.25, 19.4336, 0.25);
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(0.8);
    canvas.drawPath(path_0, paint0Fill);

    final Path path_1 = Path();
    path_1.moveTo(19.4336, 0.25);
    path_1.lineTo(323.566, 0.25);
    path_1.cubicTo(334.152, 0.25, 342.75, 9.15851, 342.75, 20.167);
    path_1.lineTo(342.75, 54.2031);
    path_1.cubicTo(334.669, 54.3416, 328.175, 61.179, 328.175, 69.5752);
    path_1.cubicTo(328.175, 77.9713, 334.669, 84.8078, 342.75, 84.9463);
    path_1.lineTo(342.75, 100.833);
    path_1.cubicTo(342.75, 111.841, 334.152, 120.75, 323.566, 120.75);
    path_1.lineTo(19.4336, 120.75);
    path_1.cubicTo(8.84753, 120.75, 0.25, 111.841, 0.25, 100.833);
    path_1.lineTo(0.25, 84.9463);
    path_1.cubicTo(8.3306, 84.8078, 14.8251, 77.9713, 14.8252, 69.5752);
    path_1.cubicTo(14.8252, 61.179, 8.33067, 54.3416, 0.25, 54.2031);
    path_1.lineTo(0.25, 20.167);
    path_1.cubicTo(0.25, 9.15851, 8.84753, 0.25, 19.4336, 0.25);
    path_1.close();

    final Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.black54
          .withOpacity(0.07) // شادو خفيف
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawPath(path_1, paint1Stroke);

    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = AppColors.white;
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
