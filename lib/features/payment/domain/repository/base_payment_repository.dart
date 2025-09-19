import 'package:safarni/features/payment/data/models/payment_model.dart';

abstract class BasePaymentRepository {
  Future<PaymentModel> payment(int bookingId, String bookingType);
}
