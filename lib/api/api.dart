import 'dart:convert';
import 'package:http/http.dart' as http;

class API {

  static Future<double?> getTemperature({ double? lat = -12.942966, double? long = -38.489830 }) async {
//    final _result = Map<String, double?>();
    const appid = '28db145d735c81ba39990f9c07eca878';
    final urlString = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$appid";
    final url = Uri.parse(urlString);
    final resposta = await http.get(url);
    final object =  jsonDecode(resposta.body);
    var _result['temp'] = object['main']['temp'] - 272.15;
/*
    var _result['temp_min'] = object['main']['temp_min'] - 272.15;
    var _result['temp_max'] = object['main']['temp_max'] - 272.15;
    var _result['feels_like'] = object['main']['feels_like'] - 272.15;
    return _result;
*/
    return object['main']['temp'] - 272.15;
  }
}