import 'package:flutter/material.dart';
import 'package:p/screens/home_page.dart';
import 'package:p/service/weather_serveic.dart';
import 'package:p/widgets/no_search_view.dart';
import 'package:p/widgets/weather_info_body.dart';

void main() {
  runApp(const weatherApp());
  weatherServeic().getWitherInfo(city: 'Cairo');
}

class weatherApp extends StatelessWidget {
  const weatherApp({super.key});

  Widget build(BuildContext context) {
    return HomePage();
  }
}
