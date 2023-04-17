import 'package:flutter/material.dart';
import 'package:weather/screens/city_screen.dart';
import '../utilities/constants.dart';
import '../services/weather.dart';
import 'package:intl/intl.dart';
import '../utilities/week_panel.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(
      {required this.locationWeather, required this.locationForecast});
  final locationWeather;
  final locationForecast;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

WeatherModel weatherModel = WeatherModel();
String? backImg;

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather, widget.locationForecast);
    backImg = checkTime();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  DailyWeatherData dailyWeatherData = DailyWeatherData();
  ForecastWeatherData forecastWeatherData = ForecastWeatherData();
  ForecastWeatherData forecastWeatherData1 = ForecastWeatherData();
  ForecastWeatherData forecastWeatherData2 = ForecastWeatherData();
  ForecastWeatherData forecastWeatherData3 = ForecastWeatherData();
  ForecastWeatherData forecastWeatherData4 = ForecastWeatherData();

  void updateUI(dynamic weatherData, dynamic forecastData) {
    setState(() {
      //data1 = weatherData;
      dailyWeatherData.update(weatherData);
      if (weatherData == null) {
        dailyWeatherData.temperature = 0;
        dailyWeatherData.weatherIcon = 'error';
        cityName = 'unable to get weather';
        return;
      }
      //data2 = forecastData;
      forecastWeatherData.update(forecastData: forecastData, index: 8);
      forecastWeatherData1.update(forecastData: forecastData, index: 16);
      forecastWeatherData2.update(forecastData: forecastData, index: 24);
      forecastWeatherData3.update(forecastData: forecastData, index: 32);
      forecastWeatherData4.update(forecastData: forecastData, index: 39);
    });
  }

  String? checkTime() {
    String dt0 = DateFormat.Hm().format(DateTime.now());
    DateTime dt1 = DateFormat("hh:mm").parse(dt0);
    DateTime dt2 = DateFormat("hh:mm").parse("05:00");
    DateTime dt3 = DateFormat("hh:mm").parse("19:00");
    if (dt1.compareTo(dt2) > 0 && dt1.compareTo(dt3) < 0) {
      return 'images/location_day2.jpeg';
    } else {
      return 'images/location_dark.jpeg';
    }
  }

  List<String> getWeekDay() {
    DateTime start = DateTime.now();
    int i = 0;
    List<String> list = [];
    while (i < 7) {
      list.add(DateFormat.E().format(start));
      start = start.add(const Duration(days: 1));
      i++;
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('$backImg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                color: const Color(0x00000000),
                elevation: 0,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      DateFormat.jm().format(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    const Text(
                      '\n',
                    ),
                    Text(
                      DateFormat.MMMMEEEEd().format(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                child: Card(
                  margin: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  color: Colors.black.withOpacity(0.3),
                  shadowColor: Colors.black,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${dailyWeatherData.country} | ${dailyWeatherData.cityName}',
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${dailyWeatherData.temperature}°',
                                  style: kTempTextStyle,
                                ),
                                Center(
                                  child: Text(
                                    '${dailyWeatherData.description}\nhumidity: ${dailyWeatherData.humidity}\npressure: ${dailyWeatherData.pressure}',
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${dailyWeatherData.weatherIcon}',
                              style: kConditionTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WeekPanel(
                    tem: forecastWeatherData.tem,
                    press: forecastWeatherData.press,
                    des: forecastWeatherData.des,
                    hum: forecastWeatherData.hum,
                    feelsLike: forecastWeatherData.feelslk,
                    weatherIcon: dailyWeatherData.weatherIcon,
                    day: 1,
                  ),
                  WeekPanel(
                    tem: forecastWeatherData1.tem,
                    press: forecastWeatherData1.press,
                    des: forecastWeatherData1.des,
                    hum: forecastWeatherData1.hum,
                    feelsLike: forecastWeatherData1.feelslk,
                    weatherIcon: dailyWeatherData.weatherIcon,
                    day: 2,
                  ),
                  WeekPanel(
                    tem: forecastWeatherData2.tem,
                    press: forecastWeatherData2.press,
                    des: forecastWeatherData2.des,
                    hum: forecastWeatherData2.hum,
                    feelsLike: forecastWeatherData2.feelslk,
                    weatherIcon: dailyWeatherData.weatherIcon,
                    day: 3,
                  ),
                  WeekPanel(
                    tem: forecastWeatherData3.tem,
                    press: forecastWeatherData3.press,
                    des: forecastWeatherData3.des,
                    hum: forecastWeatherData3.hum,
                    feelsLike: forecastWeatherData3.feelslk,
                    weatherIcon: dailyWeatherData.weatherIcon,
                    day: 4,
                  ),
                  WeekPanel(
                    tem: forecastWeatherData4.tem,
                    press: forecastWeatherData4.press,
                    des: forecastWeatherData4.des,
                    hum: forecastWeatherData4.hum,
                    feelsLike: forecastWeatherData4.feelslk,
                    weatherIcon: dailyWeatherData.weatherIcon,
                    day: 5,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      var forecastData =
                          await weatherModel.getLocationForecast();
                      updateUI(weatherData, forecastData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      if (typedName != null) {
                        var weatherData =
                            await weatherModel.getCityWeather(typedName);
                        var forecastData =
                            await weatherModel.getCityForecast(typedName);
                        updateUI(weatherData, forecastData);
                        // updateUI(forecastData);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
