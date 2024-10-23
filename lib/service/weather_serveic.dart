import 'package:dio/dio.dart';
import 'package:p/model/news_service_model.dart';

class weatherServeic {
  Future<WeatherInfoModle> getWitherInfo({required String city}) async {
    String KeyAPi = 'c270594cf91d4da1b98105943242210';
    String http =
        'https://api.weatherapi.com/v1/forecast.json?key=${KeyAPi}&q=${city}';

    Response response = await Dio().get(http);
    Map<String, dynamic> jsonData = response.data;
    WeatherInfoModle result = WeatherInfoModle(
      avg: 0,
      cityName: '',
      maxTemp: 0,
      minTmp: 0,
      status: '',
    );
    for (var element in jsonData['forecast']["forecastday"]) {
      result = WeatherInfoModle(
          avg: element['day']['avgtemp_c'],
          cityName: jsonData['location']['name'],
          maxTemp: element['day']['maxtemp_c'],
          minTmp: element['day']['mintemp_c'],
          status: element['day']['condition']['text']);
    }
    return result;
  }
}
