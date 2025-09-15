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

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<HotelApiSource>(HotelApiSource(dio: Dio()));
  getIt.registerSingleton<RoomApiSource>(RoomApiSource(dio: Dio()));
  getIt.registerSingleton<HotelBookingRepo>(
    HotelBookingRepoImpl(apiSource: getIt<HotelApiSource>()),
  );

  getIt.registerSingleton<HotelsUseCase>(
    HotelsUseCase(hotelBookingRepo: getIt<HotelBookingRepo>()),
  );
  getIt.registerSingleton<RoomDetailsRepo>(
    RoomDetailsRepoImpl(apiSource: getIt<HotelApiSource>()),
  );
  getIt.registerSingleton<RoomDetailsUseCase>(
    RoomDetailsUseCase(roomRepo: getIt<RoomDetailsRepo>()),
  );
  getIt.registerSingleton<RoomRepo>(
    RoomRepoImpl(apiSource: getIt<RoomApiSource>()),
  );
  getIt.registerSingleton<RoomUseCase>(
    RoomUseCase(roomRepo: getIt<RoomRepo>()),
  );
  getIt.registerSingleton<ReviewRepo>(ReviewRepoImpl());
  getIt.registerSingleton<GalleryRepo>(GalleryRepoImpl());
  getIt.registerSingleton<AddGalleryUseCase>(
    AddGalleryUseCase(galleryRepo: getIt<GalleryRepo>()),
  );
  getIt.registerSingleton<DisplayGalleryUseCase>(
    DisplayGalleryUseCase(galleryRepo: getIt<GalleryRepo>()),
  );
  getIt.registerSingleton<MyRoomBookingApiSource>(
    MyRoomBookingApiSource(dio: Dio()),
  );
  getIt.registerSingleton<MyRoomBookingRepo>(
    MyRoomBookingRepoImpl(apiSource: getIt<MyRoomBookingApiSource>()),
  );
  getIt.registerSingleton<MyRoomBookingUseCase>(
    MyRoomBookingUseCase(myRoomBookingRepo: getIt<MyRoomBookingRepo>()),
  );
}
