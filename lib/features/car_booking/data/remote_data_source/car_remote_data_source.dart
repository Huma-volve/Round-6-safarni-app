import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:safarni/features/car_booking/data/models/car_model.dart';

class CarRemoteDataSource {
  final Dio _dio = Dio();

  Future<List<CarModel>> fetchCars() async {
    try {
      final response = await _dio.get(
        'http://round5-safarnia.huma-volve.com/api/cars',
      );

      if (response.statusCode == 200) {
        final List data = response.data["cars"];
        return data.map((json) => CarModel.fromJson(json)).toList();
      } else {
        throw Exception('  erorr fetch data ');
      }
    } catch (e) {
      log("error data cars $e");
      throw Exception('error: $e');
    }
  }

  Future<CarModel> fetchCarById(int id) async {
    final response = await _dio.get(
      'https://round5-safarnia.huma-volve.com/api/cars/$id',
    );
    if (response.statusCode == 200) {
      final data = response.data['car'] ?? response.data;
      return CarModel.fromJson(data);
    } else {
      throw Exception(
        'Failed to fetch car with id $id: Status ${response.statusCode}',
      );
    }
  }
}
