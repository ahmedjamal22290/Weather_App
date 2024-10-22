import 'package:flutter/material.dart';
import 'package:p/screens/search_page.dart';
import 'package:p/widgets/no_search_view.dart';
import 'package:p/widgets/weather_info_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: weatherInfoBody(),
      ),
    );
  }
}
