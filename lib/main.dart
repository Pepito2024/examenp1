import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _altura = 160; // Altura inicial en centímetros
  double _peso = 60;   // Peso inicial en kilogramos
  double _imc = 0;

  void _calcularIMC() {
    if (_altura > 0 && _peso > 0) {
      setState(() {
        _imc = _peso / ((_altura / 100) * (_altura / 100));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              'Peso (kg): ${_peso.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _peso,
              min: 30,
              max: 200,
              onChanged: (value) {
                setState(() {
                  _peso = value;
                });
              },
            ),
                        Text(
              'Altura (cm): ${_altura.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _altura,
              min: 100,
              max: 250,
              onChanged: (value) {
                setState(() {
                  _altura = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(
              'Tu IMC es: ${_imc.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
