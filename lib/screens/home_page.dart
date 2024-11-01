import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:p/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:p/main.dart';
import 'package:p/model/news_service_model.dart';
import 'package:p/screens/search_page.dart';
import 'package:p/widgets/no_search_view.dart';
import 'package:p/widgets/weather_info_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _transtion;
  late Animation<Offset> _transtionn;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 125));
    _transtion = Tween(begin: -25.0, end: 25.0).animate(_controller);
    _transtionn = Tween<Offset>(begin: Offset(-25, 0), end: Offset(25, 0))
        .animate(_controller);

    if (!BlocProvider.of<GetWeatherCubit>(context).darkMode) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Weather',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Text(
              'App',
              style: TextStyle(
                  color: Colors.greenAccent, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext, _) {
                    return Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color:
                            BlocProvider.of<GetWeatherCubit>(context).darkMode
                                ? const Color(0xFF272727)
                                : Colors.white,
                      ),
                      child: Transform.translate(
                        offset: _transtionn.value,
                        child: IconButton(
                          onPressed: () {
                            BlocProvider.of<GetWeatherCubit>(context).darkMode
                                ? _controller.reverse()
                                : _controller.forward();
                            BlocProvider.of<GetWeatherCubit>(context).darkMode =
                                !BlocProvider.of<GetWeatherCubit>(context)
                                    .darkMode;
                          },
                          icon: Icon(
                            BlocProvider.of<GetWeatherCubit>(context).darkMode
                                ? Icons.wb_sunny
                                : Icons.mode_night,
                            color: BlocProvider.of<GetWeatherCubit>(context)
                                    .darkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 35,
              ),
            ),
          )
        ],
        // backgroundColor: const Color(0xFF3163B9),
      ),
      // backgroundColor: Colors.white,
      body: BlocBuilder<GetWeatherCubit, weatherState>(
        builder: (context, State) {
          if (State is noWeatherState) {
            return const NoSearchView();
          } else if (State is weatherLoadedState) {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                getColorTheme(State.weatherInfoModle.status).withAlpha(60),
                getColorTheme(State.weatherInfoModle.status),
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
              child: weatherInfoBody(
                weatherInfo: State.weatherInfoModle,
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [Colors.redAccent, Colors.white],
              )),
              child: const Center(
                  child: Text(
                'oops there was an error',
                style: TextStyle(
                  fontSize: 37,
                  fontWeight: FontWeight.bold,
                ),
              )),
            );
          }
        },
      ),
    );
  }
}

// Cubit pattern steps


// create states 
// create cubit
// create function
// provide cubit 
// integrate cubit 
// trigger cubit 