import 'package:flutter/material.dart';
import 'package:weather/services/weather.dart';
import '../screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

double? latitude;
double? longitude;
int step = 100;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // print('step 1');
    getLocationData();
  }

  getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    var forecastData = await weatherModel.getLocationForecast();
    // print('step 4');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationWeather: weatherData,
          locationForecast: forecastData,
        ),
      ),
    );
    // print('step 2');
  }

  @override
  Widget build(BuildContext context) {
    // if (step > 100) {
    //   setState(() {
    //     ++step;
    //     print('step $step');
    //   });
    // }
    // print('step 100');
    // ++step;
    return const Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}
