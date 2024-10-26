import 'package:bloc/bloc.dart';
import 'package:p/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:p/screens/search_page.dart';
import 'package:p/service/weather_serveic.dart';

class GetWeatherCubit extends Cubit<weatherState> {
  GetWeatherCubit(super.initialState);

  getWeather({required String cityName}) async {
    weathermodel = await weatherServeic().getWitherInfo(city: cityName);
  }
}
