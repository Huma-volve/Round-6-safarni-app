import 'package:safarni/features/payment/domain/entity/payment.dart';

class PaymentModel extends Payment {
  const PaymentModel({required super.paymentId, required super.clientSecret});

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    paymentId: json['payment_id'],
    clientSecret: json['client_secret'],
  );
}
