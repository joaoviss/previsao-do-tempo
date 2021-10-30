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
      API().getWeather().then((weatheer) {
        _weather = weatheer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final String? _ftemp = _weather != null ? _weather!.temp.toStringAsFixed(1) : null;
    final String? _ftempMax   = _weather != null ? _weather!.tempMax.toStringAsFixed(1) : null;
    final String? _ftemp_min = _weather != null ? _weather!.tempMin.toStringAsFixed(1) : null;
    final String? _sens = _weather != null ? _weather!.sens.toStringAsFixed(1) : null;
    final String? _desc = _weather != null ? _weather!.desc : null;
     return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do Tempo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Temperatura: $_ftemp',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            ),
            
          ],
      )
,
      )
    );
  }
}