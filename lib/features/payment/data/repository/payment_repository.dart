import 'package:safarni/features/payment/data/data_source/payment_remote_data_source.data.dart';
import 'package:safarni/features/payment/data/models/payment_model.dart';
import 'package:safarni/features/payment/domain/repository/base_payment_repository.dart';

class PaymentRepository implements BasePaymentRepository {
  final BasePaymentDataSource basePaymentDataSource;

  PaymentRepository(this.basePaymentDataSource);

  @override
  Future<PaymentModel> payment(int bookingId, String bookingType) async {
    return await basePaymentDataSource.payment(bookingId, bookingType);
  }
}
