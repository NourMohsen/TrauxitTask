import 'package:dio/dio.dart';
import 'package:weather_api_task/data/models/weather_model.dart';

class ApiServices {
  Future<WeatherModel> fetchWeatherData({required String cityName,}) async {
    final dio = Dio();
    const apiKey = 'd0f406a29839bbd119fda717f86a3528';
    const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';    try {
      final response = await dio.get('$baseUrl?q=$cityName&appid=$apiKey&units=metric');
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      }
      throw response.data.toString();
    } catch (e) {
      throw Exception('Failed to fetch weather');
    }
  }
}

