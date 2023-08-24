
import 'package:weather_api_task/data/services/api_services.dart';

class WeatherRepo {
  final ApiServices apiServices;
  WeatherRepo(this.apiServices);
  Future<dynamic> getLocationWeather({required String cityName}) async {
    var weatherData = apiServices.fetchWeatherData(cityName: cityName);
    return weatherData;
  }
}
