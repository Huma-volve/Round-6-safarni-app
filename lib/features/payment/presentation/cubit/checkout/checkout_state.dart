import 'package:equatable/equatable.dart';
import 'package:safarni/features/payment/domain/entity/payment.dart';

abstract class CheckOutState extends Equatable {
  const CheckOutState();

  @override
  List<Object?> get props => [];
}

class CheckoutInitial extends CheckOutState {}

class CheckoutLoading extends CheckOutState {}

class CheckoutSuccess extends CheckOutState {
  final Payment payment;

  const CheckoutSuccess(this.payment);

  @override
  List<Object?> get props => [payment];
}

class CheckoutFailure extends CheckOutState {
  final String error;

  const CheckoutFailure(this.error);

  @override
  List<Object?> get props => [error];
}
