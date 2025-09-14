import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/features/car_booking/presentation/widgets/material_buttom_widget.dart';

class CarModel {
  final String name;
  final Widget image;
  final String automatic;
  final String seats;
  final String type;

  CarModel({
    required this.automatic,
    required this.seats,
    required this.name,
    required this.image,
    required this.type,
  });
}

List<CarModel> carinfoMap = [
  CarModel(
    name: "S 500 Sedan",
    image: Image.asset(AppImages.type_car_2, height: 165, width: 200),
    type: "patroal",
    automatic: "Automatic",
    seats: "seats",
  ),
  CarModel(
    name: "S 500 Sedan",
    image: Image.asset(AppImages.type_car_1, height: 165, width: 230),
    type: "patroal",
    automatic: "Automatic",
    seats: "seats",
  ),
  CarModel(
    name: "S 500 Sedan",
    image: Image.asset(AppImages.type_car_1, height: 165, width: 230),
    type: "patroal",
    automatic: "Automatic",
    seats: "seats",
  ),
  CarModel(
    name: "S 500 Sedan",
    image: Image.asset(AppImages.type_car_3, height: 165, width: 200),
    type: "patroal",
    automatic: "Automatic",
    seats: "seats",
  ),
];

class CoulumCarMap extends StatefulWidget {
  const CoulumCarMap({super.key, required this.carModel});
  final CarModel carModel;

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
          widget.carModel.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),
        Row(
          spacing: 25,
          children: [
            Text(widget.carModel.automatic),

            Text("|"),

            Text(widget.carModel.seats),

            Text("|"),

            Text(widget.carModel.type),
            SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "\$80 ",
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
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "\$2550 ",
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
