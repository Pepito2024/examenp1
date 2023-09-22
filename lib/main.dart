import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  double _altura = 170; // Altura predeterminada en cm
  double _peso = 70; // Peso predeterminado en kg

  double _imc = 0;
  String _resultado = "";

  void _calcularIMC() {
    setState(() {
      _imc = _peso / ((_altura / 100) * (_altura / 100));

      if (_imc < 18.5) {
        _resultado = "Bajo peso";
      } else if (_imc >= 18.5 && _imc <= 24.9) {
        _resultado = "Peso normal";
      } else {
        _resultado = "Sobrepeso";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC APP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(
              'Bienvenido selecciona tu altura y tu peso',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Text(
              'Selecciona tu altura (cm):',
            ),
            Slider(
              value: _altura,
              min: 100,
              max: 220,
              onChanged: (value) {
                setState(() {
                  _altura = value;
                });
              },
            ),
            Text('Altura: ${_altura.toStringAsFixed(1)} cm'),
            SizedBox(height: 20),
            Text(
              'Selecciona tu peso (kg):',
            ),
            Slider(
              value: _peso,
              min: 30,
              max: 150,
              onChanged: (value) {
                setState(() {
                  _peso = value;
                });
              },
            ),
            Text('Peso: ${_peso.toStringAsFixed(1)} kg'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 20),
            Text(
              'Tu IMC es: ${_imc.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Resultado: $_resultado',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
