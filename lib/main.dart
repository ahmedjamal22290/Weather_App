import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:p/model/news_service_model.dart';
import 'package:p/screens/home_page.dart';
import 'package:p/service/weather_serveic.dart';
import 'package:p/widgets/no_search_view.dart';
import 'package:p/widgets/weather_info_body.dart';

void main() async {
  runApp(const weatherApp());
}

class weatherApp extends StatelessWidget {
  const weatherApp({super.key});
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.red,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
