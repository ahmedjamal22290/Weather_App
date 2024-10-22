import 'package:flutter/material.dart';

class weatherInfoBody extends StatelessWidget {
  const weatherInfoBody({super.key});

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Alexandria',
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Updated at 23:46 ',
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
                Image.asset('assets/images/clear.png'),
                Spacer(),
                Text(
                  '19',
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
                      'MaxTemp:24',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'MinTemp:16',
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
            'Clear',
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
