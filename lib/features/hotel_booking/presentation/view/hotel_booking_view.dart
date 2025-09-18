import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/helper/custom_app_bar.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/features/hotel_booking/domain/usecases/hotels_use_case.dart';
import 'package:safarni/features/hotel_booking/presentation/manager/cubit/get_hotels_cubit.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/hotel_banking_view_body.dart';

class HotelBookingView extends StatelessWidget {
  const HotelBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetHotelsCubit(sl.get<HotelsUseCase>())..getHotels(),
      child: Scaffold(
        appBar: customAppBar(context: context),
        body: const HotelBankingViewBody(),
      ),
    );
  }
}
