import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:previsao_do_tempo/api/model/weather_info.dart';

class API {

  Future<WeatherInfo?> getWeather({double? lat = -12.942966, double? long = -38.489830}) async {
    const appId = "28db145d735c81ba39990f9c07eca878";
    final urlString = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$appId";
    final url = Uri.parse(urlString);
    final response = await http.get(url);
    final object = jsonDecode(response.body);
    final weather = WeatherInfo.fromObject(object);
    return weather;
  }
}
/*
    print('=> weather: $weather');
    print('=> object: $object');
    print('=> resposta: $resposta');
    print('=> url: $url');
    print('=> urlString: $urlString');
    print('=> appid: $appId');
*/