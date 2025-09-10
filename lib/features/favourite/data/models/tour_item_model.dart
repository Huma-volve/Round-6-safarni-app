import '../../../../core/constants/app_images.dart';
class TourItemModel {
  final String image;
  final String title;
  final double? rating;
  final String? review;
  final String? pickup;
  final String? days;
  final String price;
  final String? time;
  final bool isFavourite;

  const TourItemModel({
    required this.image,
    required this.title,
    required this.price,
     this.time,
     this.rating,
    this.review,
     this.pickup,
     this.days,
    this.isFavourite=false ,
  });

  TourItemModel copyWith({
    String? image,
    String? title,
    double? rating,
    String? review,
    String? pickup,
    String? days,
    String? price,
    String? time,
    bool? isFavourite,
  }) {
    return TourItemModel(
      image: image ?? this.image,
      title: title ?? this.title,
      rating: rating ?? this.rating,
      review: review ?? this.review,
      pickup: pickup ?? this.pickup,
      days: days ?? this.days,
      price: price ?? this.price,
      time: time??this.time,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}


List<TourItemModel> availableTourList = [
  TourItemModel(
    image: AppImages.fayoumPhoto,
    title: "Fayoum",
    review: "4.8",
    price: "200",
    time: "FullDayTour",
  ),
  TourItemModel(
    image: AppImages.dahabPhoto,
    title: "Dahab",
    review: "4.1",
    price: "400",
    time: "FullDayTour",
  ),
  TourItemModel(
    image: AppImages.luxuryPhoto,
    title: "Luxor",
    review: "4.9",
    price: "200",
    time: "FullDayTour",
  ),
  TourItemModel(
    image: AppImages.fayoumPhoto,
    title: "Fayoum",
    review: "4.2",
    price: "150",
    time: "FullDayTour",
  ),
];


final List<TourItemModel> tours = [
  TourItemModel(
    image: "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=800&q=80",
    title: "Double Dreams in Paris",
    rating: 4.5,
    review: "650",
    pickup: "Pickup Available",
    days: "5 Days",
    price: "1050\$",
    time: "FullDayTour",
  ),
  TourItemModel(
    image: "https://images.unsplash.com/photo-1505761671935-60b3a7427bad?auto=format&fit=crop&w=800&q=80",
    title: "Paris City Tour",
    rating: 4.1,
    review: "2750",
    pickup: "Pickup Available",
    days: "7 Days",
    price: "1500\$",
    time: "FullDayTour",
  ),
  TourItemModel(
    image: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80",
    title: "Venice Boat Tour",
    rating: 4.7,
    review: "1240",
    pickup: "Pickup Available",
    days: "3 Days",
    price: "890\$",
    time: "FullDayTour",
  ),
  TourItemModel(
    image: "https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?auto=format&fit=crop&w=800&q=80",
    title: "Bangkok Nightlife",
    rating: 4.6,
    review: "980",
    pickup: "Pickup Available",
    days: "4 Days",
    price: "1150\$",
    time: "FullDayTour",

  ),
  TourItemModel(
    image: "https://images.unsplash.com/photo-1528909514045-2fa4ac7a08ba?auto=format&fit=crop&w=800&q=80",
    title: "Tokyo Highlights",
    rating: 4.9,
    review: "3120",
    pickup: "Pickup Available",
    days: "6 Days",
    price: "2100\$",
    time: "FullDayTour",
  ),
];



