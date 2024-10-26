import 'package:bloc/bloc.dart';
import 'package:p/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:p/model/news_service_model.dart';
import 'package:p/screens/search_page.dart';
import 'package:p/service/weather_serveic.dart';

class GetWeatherCubit extends Cubit<weatherState> {
  GetWeatherCubit() : super(noWeatherState());

  getWeather({required String cityName}) async {
    try {
      WeatherInfoModle weathermodel =
          await weatherServeic().getWitherInfo(city: cityName);
      emit(weatherLoadedState());
    } catch (e) {
      emit(weatherFailuerState());
    }
  }
}
