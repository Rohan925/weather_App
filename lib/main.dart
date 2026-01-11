import 'package:flutter/material.dart';
import 'package:weather/loading_screen.dart';

void main() {
  runApp(const Weather());
}

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
