import 'package:safarni/features/payment/data/models/payment_model.dart';
import 'package:safarni/features/payment/domain/repository/base_payment_repository.dart';

class PaymentUseCase {
  final BasePaymentRepository basePaymentRepository;

  PaymentUseCase(this.basePaymentRepository);

  Future<PaymentModel> call(int bookingId, String bookingType) async {
    return await basePaymentRepository.payment(bookingId, bookingType);
  }
}
