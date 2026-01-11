import 'package:flutter/material.dart';
import 'package:weather/networking.dart';
import 'location.dart';

const apikey = 'your apikey';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    getData();
  }

  void getData() async {
    NetworkBrain networkBrain = NetworkBrain(
      url:
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey',
    );

    var weatherData = await networkBrain.getData();
    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'images/image3.png',
            height: 350.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 55.0),
            child: const Text(
              'Discover the Weather in Your City',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'PoppinsBold',
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 21.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 68.5),
            child: Text(
              'Get to Know Your Weather Maps And Radar Precipitation Forecast',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'PoppinsRegular',
                color: Colors.grey.shade600,
              ),
            ),
          ),
          const SizedBox(height: 55.5),
          GestureDetector(
            onTap: () {
              getLocationData();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(19),
              height: 58.0,
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  'Get Weather',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'PoppinsRegular',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
