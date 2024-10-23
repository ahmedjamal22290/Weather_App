class WeatherInfoModle {
  String cityName, status;
  double avg, maxTemp, minTmp;
  WeatherInfoModle({
    required this.avg,
    required this.cityName,
    required this.maxTemp,
    required this.minTmp,
    required this.status,
  });
  factory WeatherInfoModle.fromJson(jsonn) {
    return WeatherInfoModle(
      avg: jsonn['forecast']["forecastday"]['day']['avgtemp_c'],
      cityName: jsonn['location']['name'],
      maxTemp: jsonn['forecast']["forecastday"]['day']['maxtemp_c'],
      minTmp: jsonn['forecast']["forecastday"]['day']['mintemp_c'],
      status: jsonn['forecast']["forecastday"]['day']['condition']['text'],
    );
  }
}
