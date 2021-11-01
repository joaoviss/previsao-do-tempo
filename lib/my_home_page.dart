import 'package:flutter/material.dart';
import 'package:previsao_do_tempo/api/api.dart';
import 'package:previsao_do_tempo/api/model/weather_info.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherInfo? _weather;

  @override
  void initState() {
    super.initState();
    setState(() {
      API().getWeather().then((weather) {
        _weather = weather;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final String? _ftemp = _weather != null ? _weather!.temp.toStringAsFixed(1) : null;
    final String? _ftempMax   = _weather != null ? _weather!.tempMax.toStringAsFixed(1) : null;
    final String? _ftempMin = _weather != null ? _weather!.tempMin.toStringAsFixed(1) : null;
    final String? _sens = _weather != null ? _weather!.sens.toStringAsFixed(1) : null;
    final String? _iconString = _weather != null ? _weather!.iconString : null;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do Tempo'),
      ),
      body: Center(
        child: _weather != null ? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black26,
                image: DecorationImage(image: NetworkImage('https://openweathermap.org/img/wn/$_iconString@2x.png')),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Temperatura: ', style: TextStyle(fontSize: 30)),
                Text('$_ftemp', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('MAX: $_ftempMax', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                Text('MIN: $_ftempMin', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ) : const CircularProgressIndicator()
      )
    );
  }
}