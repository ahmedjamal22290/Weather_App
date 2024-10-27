import 'package:flutter/material.dart';
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
              color: const Color(0xFF4C4C4C),
            ),
          ),
          Text(
            'Last Update:${weatherInfo.lastTime.substring(11)}',
            style: TextStyle(
              fontSize: 16,
              color: const Color(0xFF4C4C4C),
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
