import 'package:dio/dio.dart';
import 'package:p/model/news_service_model.dart';

class weatherServeic {
  final Dio dio = Dio();

  final String baseUrl = 'https://api.weatherapi.com/v1/';
  final String apiKey = 'c270594cf91d4da1b98105943242210';
  Future<WeatherInfoModle> getWitherInfo({required String city}) async {
    try {
      String http = '${baseUrl}forecast.json?key=${apiKey}&q=${city}';

      Response response = await dio.get(http);

      WeatherInfoModle weatherInfo = WeatherInfoModle.fromJson(response.data);

      return weatherInfo;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'oops there was an error';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('oops there was an error try again leter');
    }
  }
}
