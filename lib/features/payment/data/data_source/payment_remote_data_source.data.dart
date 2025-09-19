import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:safarni/core/constants/api_constants.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/cache_helper.dart';
import 'package:safarni/features/payment/data/models/payment_model.dart';

abstract class BasePaymentDataSource {
  Future<PaymentModel> payment(int bookingId, String bookingType);
}

class PaymentDataSource implements BasePaymentDataSource {
  Future<String?> _getToken() async {
    final userJson = await sl<CacheHelper>().getData('user');
    return userJson != null ? jsonDecode(userJson)['token'] : null;
  }

  Future<Dio> createDio() async {
    final token = await _getToken();
    return Dio(
      BaseOptions(
        headers: {if (token != null) 'Authorization': 'Bearer $token'},
      ),
    );
  }

  @override
  Future<PaymentModel> payment(int bookingId, String bookingType) async {
    final dio = await createDio();
    final response = await dio.post(
      ApiConstants.paymentUrl(bookingId, bookingType),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return PaymentModel.fromJson(response.data['data']);
    } else {
      throw Exception();
    }
  }
}
