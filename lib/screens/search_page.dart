import 'dart:developer';

import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
                onChanged: (value) {
                  log(value);
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
