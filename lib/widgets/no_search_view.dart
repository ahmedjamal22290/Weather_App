import 'package:flutter/material.dart';

class NoSearchView extends StatelessWidget {
  const NoSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'There is no weather',
            style: TextStyle(fontSize: 28),
          ),
          Text(
            'Start searching NOW',
            style: TextStyle(fontSize: 28),
          ),
        ],
      ),
    );
  }
}
