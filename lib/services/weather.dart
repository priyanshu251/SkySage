import '../screens/location_screen.dart';
import '../services/location.dart';
import '../services/networking.dart';

const apiKey = 'f16b82ad625f888262d97d1cf364340e';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationForecast() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/forecast?lat=${location.latitude}&lon=${location.longitude}&exclude=current&appid=$apiKey&units=metric');
    var forecastData = await networkHelper.getData();
    return forecastData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&exclude=current&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityForecast(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey&units=metric');
    var forecastData = await networkHelper.getData();
    return forecastData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  // String getMessage(int temp) {
  //   if (temp > 25) {
  //     return 'It\'s 🍦 time';
  //   } else if (temp > 20) {
  //     return 'Time for shorts and 👕';
  //   } else if (temp < 10) {
  //     return 'You\'ll need 🧣 and 🧤';
  //   } else {
  //     return 'Bring a 🧥 just in case';
  //   }
  // }
}

class DailyWeatherData {
  int? temperature, humidity, feelslike, pressure;
  String? description, cityName, country, weatherIcon;
  void update(dynamic weatherData) {
    temperature = weatherData['main']['temp'].toInt();
    feelslike = (weatherData['main']['feels_like']).toInt();
    description = weatherData['weather'][0]['description'];
    humidity = weatherData['main']['humidity'];
    pressure = weatherData['main']['pressure'];
    cityName = weatherData['name'];
    country = weatherData['sys']['country'];
    WeatherModel weatherModel = WeatherModel();
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weatherModel.getWeatherIcon(condition);
    // weatherMessage = weatherModel.getMessage(temperature!);
  }
}

class ForecastWeatherData {
  int? tem, hum, feelslk, press;
  String? des;
  void update({dynamic forecastData, int? index}) {
    tem = (forecastData['list'][index]['main']['temp']).toInt();
    feelslk = (forecastData['list'][index]['main']['feels_like']).toInt();
    des = forecastData['list'][index]['weather'][0]['main'];
    hum = forecastData['list'][index]['main']['humidity'];
    press = forecastData['list'][index]['main']['pressure'];
  }
}
