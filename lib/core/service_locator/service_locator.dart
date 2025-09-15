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

var s1 = GetIt.instance;

void setupServiceLocator() {
  s1.registerSingleton<HotelApiSource>(HotelApiSource(dio: Dio()));
  s1.registerSingleton<RoomApiSource>(RoomApiSource(dio: Dio()));
  s1.registerSingleton<HotelBookingRepo>(
    HotelBookingRepoImpl(apiSource: s1<HotelApiSource>()),
  );

  s1.registerSingleton<HotelsUseCase>(
    HotelsUseCase(hotelBookingRepo: s1<HotelBookingRepo>()),
  );
  s1.registerSingleton<RoomDetailsRepo>(
    RoomDetailsRepoImpl(apiSource: s1<HotelApiSource>()),
  );
  s1.registerSingleton<RoomDetailsUseCase>(
    RoomDetailsUseCase(roomRepo: s1<RoomDetailsRepo>()),
  );
  s1.registerSingleton<RoomRepo>(RoomRepoImpl(apiSource: s1<RoomApiSource>()));
  s1.registerSingleton<RoomUseCase>(RoomUseCase(roomRepo: s1<RoomRepo>()));
  s1.registerSingleton<ReviewRepo>(ReviewRepoImpl());
  s1.registerSingleton<GalleryRepo>(GalleryRepoImpl());
  s1.registerSingleton<AddGalleryUseCase>(
    AddGalleryUseCase(galleryRepo: s1<GalleryRepo>()),
  );
  s1.registerSingleton<DisplayGalleryUseCase>(
    DisplayGalleryUseCase(galleryRepo: s1<GalleryRepo>()),
  );
  s1.registerSingleton<MyRoomBookingApiSource>(
    MyRoomBookingApiSource(dio: Dio()),
  );
  s1.registerSingleton<MyRoomBookingRepo>(
    MyRoomBookingRepoImpl(apiSource: s1<MyRoomBookingApiSource>()),
  );
  s1.registerSingleton<MyRoomBookingUseCase>(
    MyRoomBookingUseCase(myRoomBookingRepo: s1<MyRoomBookingRepo>()),
  );
}
