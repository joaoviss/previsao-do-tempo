import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:previsao_do_tempo/api/model/weather_info.dart';

class API {
  final String key = "28db145d735c81ba39990f9c07eca878";

  Future<WeatherInfo?> getWeather({double? lat = -12.942966, double? long = -38.489830}) async {
    const appid = '28db145d735c81ba39990f9c07eca878';
    final urlString = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$appid";
    final url = Uri.parse(urlString);
    final resposta = await http.get(url);
    final object = jsonDecode(resposta.body);
    final weather = WeatherInfo .fromObject(object);

    return weather;
  }
}