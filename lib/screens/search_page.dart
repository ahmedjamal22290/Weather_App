import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:p/model/news_service_model.dart';
import 'package:p/screens/home_page.dart';
import 'package:p/service/weather_serveic.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

bool dataFounded = false;
WeatherInfoModle? weathermodel;

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Search a City',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF3163B9),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: (value) async {
                  BlocProvider.of<GetWeatherCubit>(context)
                      .getWeather(cityName: value);
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                    labelText: 'Search',
                    suffixIcon: Icon(
                      Icons.search,
                      size: 24,
                    ),
                    suffixIconColor: Color(0xFF3163B9),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: Color(0xFF3163B9))),
                    hintText: 'Entre City Name ',
                    enabledBorder: OutlineInputBorder()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
