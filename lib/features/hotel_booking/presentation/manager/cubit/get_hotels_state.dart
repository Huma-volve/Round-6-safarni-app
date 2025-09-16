part of 'get_hotels_cubit.dart';

sealed class GetHotelsState extends Equatable {
  const GetHotelsState();

  @override
  List<Object> get props => [];
}

final class GetHotelsInitial extends GetHotelsState {}

final class GetHotelsLoading extends GetHotelsState {}

final class GetHotelsSuccess extends GetHotelsState {
  final List<HotelsEntity> hotels;
  const GetHotelsSuccess({required this.hotels});
}

final class GetHotelsFailure extends GetHotelsState {
  final String error;
  const GetHotelsFailure({required this.error});
}
