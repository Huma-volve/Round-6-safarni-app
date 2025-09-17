import 'package:dio/dio.dart';
import 'package:safarni/features/internal_tour/data/models/internal_model.dart';

class TourRemoteDataSource {
  final Dio _dio = Dio();

  Future<List<TourModel>> fetchTours() async {
    try {
      final response = await _dio.get(
        'http://round5-safarnia.huma-volve.com/api/tours',
      );

      if (response.statusCode == 200) {
        final List data = response.data["data"];
        return data.map((json) => TourModel.fromJson(json)).toList();
      } else {
        throw Exception(
          'Error: invalid response status ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error fetching tours: $e');
    }
  }
}
