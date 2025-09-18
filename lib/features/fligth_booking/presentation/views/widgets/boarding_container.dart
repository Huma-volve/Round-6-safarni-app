import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';

class BoardingContainer extends StatelessWidget {
  const BoardingContainer({
    required this.startTime,
    required this.endTime,
    required this.month,
    required this.time,
    required this.seatNumber,
    required this.date,
    super.key,
  });
  final String startTime;
  final String endTime;
  final String month;
  final String time;
  final int seatNumber;
  final String date;

  String formatDate(String dateString) {
    try {
      final DateTime date = DateTime.parse(dateString);

      String formatted = DateFormat("MMMM d',' y").format(date);

      formatted = formatted.replaceFirstMapped(
        RegExp(r'(\d{1,2})(, )'),
        (m) => '${m[1]}h${m[2]}',
      );

      return formatted;
    } catch (e) {
      return dateString;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 500,
      child: CustomPaint(
        painter: RPSCustomPainter(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
          child: Column(
            children: [
              SvgPicture.asset(AppIcons.canda),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Air Canada',
                    style: AppStyles.font14Meduim.copyWith(
                      fontSize: 15,
                      color: AppColors.grey900,
                    ),
                  ),
                  Text(
                    formatDate(date),
                    style: AppStyles.font15Regular.copyWith(
                      fontSize: 13,
                      color: AppColors.grey900,
                    ),
                  ),
                ],
              ),
              const VerticalSpace(height: 10),
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
              const VerticalSpace(height: 10),
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
              const Divider(color: AppColors.grey400),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        '8',
                        style: AppStyles.font15Regular.copyWith(
                          fontSize: 13,
                          color: AppColors.grey500,
                        ),
                      ),
                      Text(
                        'Gate',
                        style: AppStyles.font14Meduim.copyWith(
                          fontSize: 13,
                          color: AppColors.grey900,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        seatNumber.toString(),
                        style: AppStyles.font15Regular.copyWith(
                          fontSize: 13,
                          color: AppColors.grey500,
                        ),
                      ),
                      Text(
                        'Seat',
                        style: AppStyles.font14Meduim.copyWith(
                          fontSize: 13,
                          color: AppColors.grey900,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '3',
                        style: AppStyles.font15Regular.copyWith(
                          fontSize: 13,
                          color: AppColors.grey500,
                        ),
                      ),
                      Text(
                        'Terminal',
                        style: AppStyles.font14Meduim.copyWith(
                          fontSize: 13,
                          color: AppColors.grey900,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'AC006',
                        style: AppStyles.font15Regular.copyWith(
                          fontSize: 13,
                          color: AppColors.grey500,
                        ),
                      ),
                      Text(
                        'Flight',
                        style: AppStyles.font14Meduim.copyWith(
                          fontSize: 13,
                          color: AppColors.grey900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(color: AppColors.grey400),

              Row(
                spacing: 8,
                children: [
                  Image.asset(AppImages.userImage),
                  Column(
                    children: [
                      Text('Catherine Dion', style: AppStyles.font15Regular),
                      Text(
                        '24 years, Female',
                        style: AppStyles.font15Regular.copyWith(
                          fontSize: 13,
                          color: AppColors.grey500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppIcons.sofa),
                  Text('$seatNumber A', style: AppStyles.font15Regular),
                ],
              ),
              const VerticalSpace(height: 20),
              const DottedLine(
                lineThickness: 2.0,
                dashLength: 8.0,
                dashColor: Colors.grey,
              ),

              Image.asset(AppImages.scan),
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
    canvas.scale(1, 4);
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
      ..color = Colors.black54.withOpacity(0.15)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawPath(path_1, paint1Stroke);

    final Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = AppColors.white.withOpacity(0.5);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
