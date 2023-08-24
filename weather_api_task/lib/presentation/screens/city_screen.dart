import 'package:flutter/material.dart';
import 'package:weather_api_task/data/models/weather_model.dart';
import 'package:weather_api_task/data/services/api_services.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  CityScreenState createState() => CityScreenState();
}

class CityScreenState extends State<CityScreen> {
  final TextEditingController _cityController = TextEditingController();
  ApiServices apiServices = ApiServices();
  WeatherModel? weather;
  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  Future<void> fetchWeather() async {
    final city = _cityController.text.trim();
    if (city.isNotEmpty) {
      try {
        final weather = await apiServices.fetchWeatherData( cityName: city);
        setState(() {
          this.weather = weather;
        });
      } catch (error) {
rethrow;      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _cityController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration:  InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  icon: IconButton(
                    onPressed: () async {
                      fetchWeather();
                    },
                    icon:const Icon(Icons.search),
                    color: Colors.white,
                  ),
                  hintText: 'Enter City Name',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border:const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'temperature is ${weather?.temperature.toStringAsFixed(1) ?? " "}°C\n${weather?.description ?? " "}',
                softWrap: true,
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}








