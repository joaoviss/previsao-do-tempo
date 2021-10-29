import 'package:flutter/material.dart';
import 'package:previsao_do_tempo/api/api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? _temperature;

  @override
  void initState() {
    super.initState();
    API.getTemperature().then((temp) {
      setState(() {
        _temperature = temp;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final String? ftemp = _temperature != null ? _temperature!.toStringAsFixed(1) : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do Tempo'),
      ),
      body:  Center(
        child: _temperature != null
        ? Text(
          'A temperatura atual é de $ftemp C',
          style: const TextStyle(fontSize: 25),
        )
        : const CircularProgressIndicator()
      ),
    );
  }
}

