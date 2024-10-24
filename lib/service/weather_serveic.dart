import 'package:dio/dio.dart';
import 'package:p/model/news_service_model.dart';

class weatherServeic {
  final Dio dio = Dio();

  final String baseUrl = 'https://api.weatherapi.com/v1/';
  final String KeyAPi = 'c270594cf91d4da1b98105943242210';
  Future<WeatherInfoModle> getWitherInfo({required String city}) async {
    try {
      String http = '${baseUrl}forecast.json?key=${KeyAPi}&q=${city}';

      Response response = await dio.get(http);

      WeatherInfoModle weatherInfo = WeatherInfoModle.fromJson(response.data);

      return weatherInfo;
    } on Exception catch (e) {
      return WeatherInfoModle(
          avg: 0,
          cityName: '',
          maxTemp: 0,
          minTmp: 0,
          status: '',
          lastTime: '');
    }
  }
}
