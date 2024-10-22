import 'package:dio/dio.dart';

class weatherServeic {
  Future<List<WeatherInfoModle>> getWitherInfo({required String city}) async {
    String KeyAPi = 'c270594cf91d4da1b98105943242210';
    String http =
        'https://api.weatherapi.com/v1/forecast.json?key=${KeyAPi}&q=${city}';

    Response response = await Dio().get(http);
    Map<String, dynamic> jsonData = response.data;
    List<WeatherInfoModle> result = [];
    for (var element in jsonData['forecast']["forecastday"]) {
      result.add(
        WeatherInfoModle(
            avg: element['day']['avgtemp_c'],
            cityName: jsonData['location']['name'],
            maxTemp: element['day']['maxtemp_c'],
            minTmp: element['day']['mintemp_c'],
            status: element['day']['condition']['text']),
      );
    }
    return result;
  }
}

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
}
