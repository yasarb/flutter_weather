import 'dart:async';
import 'package:meta/meta.dart';

import 'package:weather_bloc/api/api.dart';
import 'package:weather_bloc/models/models.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient}) : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    final int locationId = await this.weatherApiClient.getLocationId(city);
    return await this.weatherApiClient.fetchWeather(locationId);
  }
}
