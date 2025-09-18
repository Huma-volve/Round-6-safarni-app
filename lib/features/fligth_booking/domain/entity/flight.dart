import 'package:equatable/equatable.dart';

class Flight extends Equatable {
  final int id;
  final String from;
  final String to;
  final String departureTime;
  final String arrivalTime;
  final int price;

  const Flight({
    required this.id,
    required this.from,
    required this.arrivalTime,
    required this.departureTime,
    required this.price,
    required this.to,
  });
  @override
  List<Object?> get props => [id, from, arrivalTime, departureTime, price, to];
}
