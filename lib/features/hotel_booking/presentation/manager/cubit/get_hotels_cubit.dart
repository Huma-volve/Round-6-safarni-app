import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/hotel_booking/domain/usecases/hotels_use_case.dart';

part 'get_hotels_state.dart';

class GetHotelsCubit extends Cubit<GetHotelsState> {
  final HotelsUseCase hotelsUseCase;
  GetHotelsCubit(this.hotelsUseCase) : super(GetHotelsInitial());

  Future<void> getHotels() async {
    emit(GetHotelsLoading());
    final result = await hotelsUseCase.call();
    result.fold(
      (failure) => emit(GetHotelsFailure(error: failure.errorMessage)),
      (hotels) => emit(GetHotelsSuccess(hotels: hotels)),
    );
  }
}
