import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/features/car_booking/domain/entits/car_entity.dart';
import 'package:safarni/features/car_booking/presentation/widgets/material_buttom_widget.dart';

class CoulumCarMap extends StatefulWidget {
  const CoulumCarMap({super.key, required this.carModel});
  final Car carModel;

  @override
  State<CoulumCarMap> createState() => _ColumCarState();
}

class _ColumCarState extends State<CoulumCarMap> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.carModel.model,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),
        Row(
          spacing: 25,
          children: [
            Text(widget.carModel.transmission),

            Text("|"),

            Text("${widget.carModel.seats}"),

            Text("|"),

            Text(widget.carModel.fuelType),
            SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "\$ ${widget.carModel.dailyRate}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.top,
                    child: Text(
                      "per hour",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "\$ ${widget.carModel.dailyRate * 30}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.top,
                    child: Text(
                      "per day",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: MaterialButtonWidget(text: "Confirm", onPressed: () {}),
        ),
      ],
    );
  }
}
