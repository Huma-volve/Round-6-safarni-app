import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final int paymentId;
  final String clientSecret;

  const Payment({required this.paymentId, required this.clientSecret});
  @override
  List<Object?> get props => [paymentId, clientSecret];
}
