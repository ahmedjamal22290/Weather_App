import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:p/model/news_service_model.dart';
import 'package:p/screens/home_page.dart';
import 'package:p/service/weather_serveic.dart';
import 'package:p/widgets/no_search_view.dart';
import 'package:p/widgets/weather_info_body.dart';

void main() async {
  runApp(const weatherApp());
  WeatherInfoModle test = await weatherServeic().getWitherInfo(city: 'Cairo');
  print(test.minTmp);
}

class weatherApp extends StatelessWidget {
  const weatherApp({super.key});

  Widget build(BuildContext context) {
    return HomePage();
  }
}
