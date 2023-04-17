import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class WeekPanel extends StatelessWidget {
  WeekPanel(
      {this.tem,
      this.hum,
      this.press,
      this.des,
      this.weatherIcon,
      this.feelsLike,
      required this.day});
  int? tem;
  int day;
  int? hum;
  int? press;
  String? des;
  String? weatherIcon;
  int? feelsLike;
  late List<String> list;
  @override
  Widget build(BuildContext context) {
    list = getWeekDay();
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
                '${list[day]}\n\n$weatherIcon\n\n$tem°/$feelsLike°', //${list![day]}\n
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