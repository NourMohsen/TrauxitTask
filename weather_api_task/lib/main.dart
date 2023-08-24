import 'package:flutter/material.dart';
import 'package:weather_api_task/presentation/screens/city_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "Weather App",
        home:CityScreen());
  }
}

