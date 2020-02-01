
import 'package:weather/weather.dart';

class WeatherModel {

  String _apiKey = '2a50132195767631db0cdfe509d8af9f';
  WeatherStation weatherStation;

  Weather _weather;
  double celsius;
  double fahrenheit;
  double kelvin;

  WeatherModel(){
    weatherStation = new WeatherStation(_apiKey);
    initializeWeather();
  }

  initializeWeather() async {
    _weather = await weatherStation.currentWeather();
    celsius = _weather.temperature.celsius;
    fahrenheit = _weather.temperature.celsius;
    kelvin = _weather.temperature.kelvin;

    print('celcius: $celsius');
    print('fahrenheit: $fahrenheit');
    print('kelvin: $kelvin');

  }

  Future<String> getWeatherIcon(int condition) async {

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
