import 'package:flutter/material.dart';
import 'package:p/model/news_service_model.dart';
import 'package:p/screens/search_page.dart';
import 'package:p/widgets/no_search_view.dart';
import 'package:p/widgets/weather_info_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return blocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                const Text(
                  'Weather',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'App',
                  style: TextStyle(
                      color: Colors.greenAccent, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            actions: [
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
            backgroundColor: const Color(0xFF3163B9),
          ),
          backgroundColor: Colors.white,
          body: weathermodel == null ? NoSearchView() : weatherInfoBody(),
        ),
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