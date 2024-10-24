class WeatherInfoModle {
  String cityName, status, lastTime;
  double avg, maxTemp, minTmp;
  WeatherInfoModle({
    required this.avg,
    required this.cityName,
    required this.maxTemp,
    required this.minTmp,
    required this.status,
    required this.lastTime,
  });
  factory WeatherInfoModle.fromJson(jsonn) {
    return WeatherInfoModle(
      avg: jsonn['forecast']["forecastday"]['day']['avgtemp_c'],
      cityName: jsonn['location']['name'],
      maxTemp: jsonn['forecast']["forecastday"][0]['day']['maxtemp_c'],
      minTmp: jsonn['forecast']["forecastday"][0]['day']['mintemp_c'],
      status: jsonn['forecast']["forecastday"][0]['day']['condition']['text'],
      lastTime: jsonn['current']['last_updated'],
    );
  }
}
