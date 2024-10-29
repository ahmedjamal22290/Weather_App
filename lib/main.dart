import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:p/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:p/model/news_service_model.dart';
import 'package:p/screens/home_page.dart';
import 'package:p/service/weather_serveic.dart';
import 'package:p/widgets/no_search_view.dart';
import 'package:p/widgets/weather_info_body.dart';

void main() async {
  runApp(weatherApp());
}

class weatherApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, weatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getColorTheme(
                  state is weatherLoadedState
                      ? state.weatherInfoModle.status
                      : 'not',
                ),
              ),
              home: HomePage(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getColorTheme(String? condition) {
  if (condition == null) {
    return Colors.deepPurple;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.amber;
    case 'partly cloudy':
      return Colors.yellow;
    case 'cloudy':
      return Colors.blueGrey;
    case 'overcast':
      return Colors.grey;
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.blueGrey;
    case 'patchy rain possible':
    case 'light drizzle':
    case 'light rain':
      return Colors.lightBlue;
    case 'moderate rain':
    case 'heavy rain':
    case 'torrential rain shower':
      return Colors.blue;
    case 'patchy snow possible':
    case 'light snow':
    case 'moderate snow':
    case 'heavy snow':
      return Colors.lightBlue;
    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
      return Colors.indigo;
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.cyan;
    case 'freezing drizzle':
    case 'patchy freezing drizzle possible':
    case 'light freezing rain':
      return Colors.lightBlue;
    default:
      return Colors.deepPurple;
  }
}
