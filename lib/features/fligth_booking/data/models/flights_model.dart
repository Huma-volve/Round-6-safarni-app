import 'package:safarni/features/fligth_booking/domain/entity/flight.dart';

class FlightsModel extends Flight {
  const FlightsModel({
    required super.id,
    required super.from,
    required super.arrivalTime,
    required super.departureTime,
    required super.price,
    required super.to,
  });
  factory FlightsModel.fromJson(Map<String, dynamic> json) => FlightsModel(
    id: json['id'],
    from: json['from'],
    arrivalTime: json['arrival_time'],
    departureTime: json['departure_time'],
    price: json['price'],
    to: json['to'],
  );
}
