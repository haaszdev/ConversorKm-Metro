import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Metros e Quilômetros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: ConversorMetrosKm(),
    );
  }
}

class ConversorMetrosKm extends StatefulWidget {
  @override
  _ConversorMetrosKmState createState() => _ConversorMetrosKmState();
}

class _ConversorMetrosKmState extends State<ConversorMetrosKm> {
  double valor = 0;
  double resultado = 0;
  bool isMetrosParaKm = true;
  TextEditingController _controller = TextEditingController();

  void _converter() {
    setState(() {
      valor = double.tryParse(_controller.text) ?? 0;
      if (isMetrosParaKm) {
        resultado = valor / 1000;
      } else {
        resultado = valor * 1000;
      }
    });
  }

  void _alternarConversao() {
    setState(() {
      isMetrosParaKm = !isMetrosParaKm;
      _controller.clear();
      valor = 0;
      resultado = 0;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Metros e Quilômetros'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              isMetrosParaKm ? 'Metros para Quilômetros' : 'Quilômetros para Metros',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: isMetrosParaKm ? 'Metros' : 'Quilômetros',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                _converter();
              },
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                isMetrosParaKm
                    ? '${valor.toStringAsFixed(2)} m = ${resultado.toStringAsFixed(2)} km'
                    : '${valor.toStringAsFixed(2)} km = ${resultado.toStringAsFixed(2)} m',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: _alternarConversao,
              child: Text(
                isMetrosParaKm
                    ? 'Alternar para Quilômetros → Metros'
                    : 'Alternar para Metros → Quilômetros',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}