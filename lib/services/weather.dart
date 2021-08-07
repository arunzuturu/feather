
import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

String appId = '88465afd3196eb1a2a46d40b2edf4a57';

class WeatherModel {
  Future<dynamic> getLocationWeather ()async{

    Locator locator = Locator();
    await locator.getLocation();
    String loader = "https://api.openweathermap.org/data/2.5/weather?lat=${locator.latitude}&lon=${locator.longitude}&appid=$appId&units=metric";
    print(loader);

    NetworkHelper networkHelper = NetworkHelper(loader);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName)async{
  var url = '$openWeatherMapUrl?q=$cityName&appid=$appId&units=metric';
  NetworkHelper networkHelper = NetworkHelper(url);
  var weatherData = await networkHelper.getData();
  return weatherData;
}
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'icons/006-storm.png';
    } else if (condition < 400) {
      return 'icons/drizzle.png';
    } else if (condition < 600) {
      return 'icons/004-rain.png';
    } else if (condition < 700) {
      return 'icons/snow.png';
    } else if (condition < 800) {
      return 'icons/mist.png';
    } else if (condition == 800) {
      return 'icons/003-sun.png';
    } else if (condition <= 804) {
      return 'icons/005-cloud.png';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
