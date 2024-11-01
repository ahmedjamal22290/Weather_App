import 'package:p/model/news_service_model.dart';

class weatherState {}

class noWeatherState extends weatherState {}

class weatherLoadedState extends weatherState {
  final WeatherInfoModle weatherInfoModle;

  weatherLoadedState({required this.weatherInfoModle});
}

class darkModeWeather extends weatherState {}

class weatherFailuerState extends weatherState {}
