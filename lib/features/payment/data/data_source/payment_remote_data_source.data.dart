import 'package:dio/dio.dart';
import 'package:safarni/features/payment/data/models/payment_model.dart';

abstract class BasePaymentDataSource {
  Future<PaymentModel> payment();
}

class PaymentDataSource implements BasePaymentDataSource {
  static const String baseUrl = 'http://round5-safarnia.huma-volve.com/api';
  static const String paymentUrl =
      '$baseUrl/checkout?booking_id=1&booking_type=flight';
  @override
  Future<PaymentModel> payment() async {
    final response = await Dio().get(
      paymentUrl,
      options: Options(
        headers: {
          'Authorization':
              'Bearer 336|vQe56bZD9CfYRQAauWDXjxIDXA9pBaoOop0udkmE8ffea59d',
        },
      ),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return PaymentModel.fromJson(response.data['data']);
    } else {
      throw Exception();
    }
  }
}
