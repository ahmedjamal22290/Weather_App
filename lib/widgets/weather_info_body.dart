import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p/cubits/dark_mode_cubit/dark_mode_cubit.dart';
import 'package:p/model/news_service_model.dart';

class weatherInfoBody extends StatelessWidget {
  const weatherInfoBody({super.key, required this.weatherInfo});

  final WeatherInfoModle weatherInfo;
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            weatherInfo.cityName,
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            weatherInfo.country,
            style: TextStyle(
              fontSize: 16,
              color: BlocProvider.of<DarkModeCubit>(context).darkMode
                  ? Color.fromARGB(255, 192, 191, 191)
                  : Color(0xFF4C4C4C),
            ),
          ),
          Text(
            'Last Update:${weatherInfo.lastTime.hour}:${weatherInfo.lastTime.minute}',
            style: TextStyle(
              fontSize: 16,
              color: BlocProvider.of<DarkModeCubit>(context).darkMode
                  ? Color.fromARGB(255, 192, 191, 191)
                  : Color(0xFF4C4C4C),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5),
            child: Row(
              children: [
                Image.network(
                  'https:${weatherInfo.image}',
                  scale: 0.7,
                ),
                Spacer(),
                Text(
                  weatherInfo.avg.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      'MaxTemp:${weatherInfo.maxTemp.round()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'MinTemp:${weatherInfo.minTmp.round()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            weatherInfo.status,
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

DateTime stringToData(String value) {
  return DateTime.parse(value);
}
