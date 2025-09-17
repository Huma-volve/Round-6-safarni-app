import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:safarni/features/hotel_booking/data/data_source/api_source.dart';
import 'package:safarni/features/hotel_booking/data/repo/hotel_booking_repo_impl.dart';
import 'package:safarni/features/hotel_booking/domain/repo/hotel_booking_repo.dart';
import 'package:safarni/features/hotel_booking/domain/usecases/hotels_use_case.dart';
import 'package:safarni/features/rooms/data/api_source/room_api_source.dart';
import 'package:safarni/features/rooms/data/repo/room_repo_impl.dart';
import 'package:safarni/features/rooms/details/data/details_api_source/my_room_booking_api_source.dart';
import 'package:safarni/features/rooms/details/data/repo/gallery_repo_impl.dart';
import 'package:safarni/features/rooms/details/data/repo/my_room_booking_repo_impl.dart';
import 'package:safarni/features/rooms/details/data/repo/review_repo_impl.dart';
import 'package:safarni/features/rooms/details/data/repo/room_details_repo_impl.dart';
import 'package:safarni/features/rooms/details/domain/repo/gallery_repo.dart';
import 'package:safarni/features/rooms/details/domain/repo/my_room_booking_repo.dart';
import 'package:safarni/features/rooms/details/domain/repo/review_repo.dart';
import 'package:safarni/features/rooms/details/domain/repo/room_details_repo.dart';
import 'package:safarni/features/rooms/details/domain/room_details_use_case/add_gallery_use_case.dart';
import 'package:safarni/features/rooms/details/domain/room_details_use_case/display_gallery_use_case.dart';
import 'package:safarni/features/rooms/details/domain/room_details_use_case/my_room_booking_use_case.dart';
import 'package:safarni/features/rooms/details/domain/room_details_use_case/room_details_use_case.dart';
import 'package:safarni/features/rooms/domain/repo/room_repo.dart';
import 'package:safarni/features/rooms/domain/usecase/room_use_case.dart';
import 'package:safarni/core/network/dio_client.dart';
import 'package:safarni/core/utils/cache_helper.dart';
import 'package:safarni/features/auth/data/repo/auth_repo_imp.dart';
import 'package:safarni/features/auth/data/sources/auth_api_service.dart';
import 'package:safarni/features/auth/domain/repo/auth_repo.dart';
import 'package:safarni/features/auth/domain/use_cases/forget_password.dart';
import 'package:safarni/features/auth/domain/use_cases/login.dart';
import 'package:safarni/features/auth/domain/use_cases/register.dart';

var sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthRepo>(AuthRepoImp());
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase());
  sl.registerSingleton<LoginUseCase>(LoginUseCase());
  sl.registerSingleton<ForgetPasswordUseCse>(ForgetPasswordUseCse());
  sl.registerSingleton<CacheHelper>(CacheHelper());
  sl.registerSingleton<HotelApiSource>(HotelApiSource(dio: Dio()));
  sl.registerSingleton<RoomApiSource>(RoomApiSource(dio: Dio()));
  sl.registerSingleton<HotelBookingRepo>(
    HotelBookingRepoImpl(apiSource: sl<HotelApiSource>()),
  );

  sl.registerSingleton<HotelsUseCase>(
    HotelsUseCase(hotelBookingRepo: sl<HotelBookingRepo>()),
  );
  sl.registerSingleton<RoomDetailsRepo>(
    RoomDetailsRepoImpl(apiSource: sl<HotelApiSource>()),
  );
  sl.registerSingleton<RoomDetailsUseCase>(
    RoomDetailsUseCase(roomRepo: sl<RoomDetailsRepo>()),
  );
  sl.registerSingleton<RoomRepo>(RoomRepoImpl(apiSource: sl<RoomApiSource>()));
  sl.registerSingleton<RoomUseCase>(RoomUseCase(roomRepo: sl<RoomRepo>()));
  sl.registerSingleton<ReviewRepo>(ReviewRepoImpl());
  sl.registerSingleton<GalleryRepo>(GalleryRepoImpl());
  sl.registerSingleton<AddGalleryUseCase>(
    AddGalleryUseCase(galleryRepo: sl<GalleryRepo>()),
  );
  sl.registerSingleton<DisplayGalleryUseCase>(
    DisplayGalleryUseCase(galleryRepo: sl<GalleryRepo>()),
  );
  sl.registerSingleton<MyRoomBookingApiSource>(MyRoomBookingApiSource());
  sl.registerSingleton<MyRoomBookingRepo>(
    MyRoomBookingRepoImpl(apiSource: sl<MyRoomBookingApiSource>()),
  );
  sl.registerSingleton<MyRoomBookingUseCase>(
    MyRoomBookingUseCase(myRoomBookingRepo: sl<MyRoomBookingRepo>()),
  );
}
