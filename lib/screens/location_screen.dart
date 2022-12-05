import 'package:flutter/material.dart';
import 'package:weather/screens/city_screen.dart';
import '../utilities/constants.dart';
import '../services/weather.dart';
import 'package:intl/intl.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(
      {required this.locationWeather, required this.locationForecast});
  final locationWeather;
  final locationForecast;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

int index = 8;
List<String>? list;
String? backImg;
WeatherModel weatherModel = WeatherModel();
int? temperature;
int? feelsLike;
int? tem1;
int? tem2;
int? tem3;
int? tem4;
int? tem5;
int? feelLike1;
int? feelLike2;
int? feelLike3;
int? feelLike4;
int? feelLike5;
String? weatherIcon;
String? weatherMessage;
String? country;
String? cityName;
String? description;
String? des1;
String? des2;
String? des3;
String? des4;
String? des5;
int? hum1;
int? hum2;
int? hum3;
int? hum4;
int? hum5;
int? press1;
int? press2;
int? press3;
int? press4;
int? press5;
int? humidity;
int? pressure;
String? icon;

String? day;

// var format = DateFormat.yMd('ar');
// var dateString = format.format(DateTime.now());

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    // print('step 5');
    updateUI(widget.locationWeather, widget.locationForecast);
    backImg = checkTime();
    list = getWeekDay();
  }

  @override
  void deactivate() {
    super.deactivate();
    // print('step 7');
  }

  void updateUI(dynamic weatherData, dynamic forecastData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'error';
        weatherMessage = 'unable to get weather';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      double fl = weatherData['main']['feels_like'];
      feelsLike = fl.toInt();
      weatherMessage = weatherModel.getMessage(temperature!);
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      // print(weatherData['weather'][0]['main']);
      description = weatherData['weather'][0]['description'];
      humidity = weatherData['main']['humidity'];
      pressure = weatherData['main']['pressure'];
      icon = weatherData['weather'][0]['icon'];
      cityName = weatherData['name'];
      country = weatherData['sys']['country'];
      double t1 = forecastData['list'][index]['main']['temp'];
      tem1 = t1.toInt();
      double fl1 = forecastData['list'][index]['main']['feels_like'];
      feelLike1 = fl1.toInt();
      des1 = forecastData['list'][index]['weather'][0]
          ['main']; //change des to main
      hum1 = forecastData['list'][index]['main']['humidity'];
      press1 = forecastData['list'][index]['main']['pressure'];
      index = index + 8;
      double t2 = forecastData['list'][index]['main']['temp'];
      tem2 = t2.toInt();
      double fl2 = forecastData['list'][index]['main']['feels_like'];
      feelLike2 = fl2.toInt();
      des2 = forecastData['list'][index]['weather'][0]
          ['main']; //change des to main
      hum2 = forecastData['list'][index]['main']['humidity'];
      press2 = forecastData['list'][index]['main']['pressure'];
      index = index + 8;
      double t3 = forecastData['list'][index]['main']['temp'];
      tem3 = t3.toInt();
      double fl3 = forecastData['list'][index]['main']['feels_like'];
      feelLike3 = fl3.toInt();
      des3 = forecastData['list'][index]['weather'][0]
          ['main']; //change des to main
      hum3 = forecastData['list'][index]['main']['humidity'];
      press3 = forecastData['list'][index]['main']['pressure'];
      index = index + 8;
      double t4 = forecastData['list'][index]['main']['temp'];
      tem4 = t4.toInt();
      double fl4 = forecastData['list'][index]['main']['feels_like'];
      feelLike4 = fl4.toInt();
      des4 = forecastData['list'][index]['weather'][0]
          ['main']; //change des to main
      hum4 = forecastData['list'][index]['main']['humidity'];
      press4 = forecastData['list'][index]['main']['pressure'];
      index = index + 7;
      double t5 = forecastData['list'][index]['main']['temp'];
      tem5 = t5.toInt();
      double fl5 = forecastData['list'][index]['main']['feels_like'];
      feelLike5 = fl5.toInt();
      des5 = forecastData['list'][index]['weather'][0]
          ['main']; //change des to main
      hum5 = forecastData['list'][index]['main']['humidity'];
      press5 = forecastData['list'][index]['main']['pressure'];
    });
  }

  // String dateAndTime() {
  //   var format = DateFormat.yMd('ar');
  //   var dateString = format.format(DateTime.now());
  //   return dateString;
  // }

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
    // print('step 6');
    return Scaffold(
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
                        '$country | $cityName',
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
                                  '$temperature°',
                                  style: kTempTextStyle,
                                ),
                                Center(
                                  child: Text(
                                    '$description\nhumidity: $humidity\npressure: $pressure',
                                    // style: TextStyle(
                                    //   fontSize: 20,
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '$weatherIcon',
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
                    tem: tem1,
                    press: press1,
                    des: des1,
                    hum: hum1,
                    feelsLike: feelLike1,
                    day: 1,
                  ),
                  WeekPanel(
                    tem: tem2,
                    press: press2,
                    des: des2,
                    hum: hum2,
                    feelsLike: feelLike2,
                    day: 2,
                  ),
                  WeekPanel(
                    tem: tem3,
                    press: press3,
                    des: des3,
                    hum: hum3,
                    feelsLike: feelLike3,
                    day: 3,
                  ),
                  WeekPanel(
                    tem: tem4,
                    press: press4,
                    des: des4,
                    hum: hum4,
                    feelsLike: feelLike4,
                    day: 4,
                  ),
                  WeekPanel(
                    tem: tem5,
                    press: press5,
                    des: des5,
                    hum: hum5,
                    feelsLike: feelLike5,
                    day: 5,
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 15.0),
              //   child: //Text(DateFormat.E().format(DateTime.now())),
              //       Text(
              //     "$weatherMessage in $cityName!",
              //     textAlign: TextAlign.right,
              //     style: kMessageTextStyle,
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      var forecastData =
                          await weatherModel.getLocationForecast();
                      index = 8;
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

class WeekPanel extends StatelessWidget {
  WeekPanel(
      {this.tem,
      this.hum,
      this.press,
      this.des,
      this.feelsLike,
      required this.day});
  int? tem;
  int day;
  int? hum;
  int? press;
  String? des;
  int? feelsLike;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 184,
      child: Card(
        color: Colors.black.withOpacity(0.4),
        shadowColor: Colors.black,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${list![day]}\n\n$weatherIcon\n$tem°/$feelsLike°',
                textAlign: TextAlign.center,
              ),
              Text(
                '$des\n$hum\n$press',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//https://api.openweathermap.org/data/2.5/forecast?q=bhubaneswar&appid=f16b82ad625f888262d97d1cf364340e&units=metric
//https://openweathermap.org/weather-conditions
