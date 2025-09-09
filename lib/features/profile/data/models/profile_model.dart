import '../../domain/entities/profile_entity.dart';

class ProfileModel {
   final String id;
  final String name;
  final String email;
  final String phone;
  final String imageUrl;
  final String country;

  ProfileModel({required this.id, required this.name, required this.email, required this.phone, required this.imageUrl,required this.country});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      imageUrl: json['imageUrl'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }


  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      imageUrl: imageUrl,
      country: country,
    );
  }
}