import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Home(),
    theme: ThemeData(fontFamily: 'Muli'),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = 'Informe seus dados';

  void resetFields() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _infoText = 'Informe seus dados';
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text);
      double imc = weight / (height * height);
      if (imc < 18.5) {
        _infoText = 'Abaixo do Peso! (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 18.5 && imc <= 24.9) {
        _infoText = 'Peso Ideal! (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 25.0 && imc <= 29.9) {
        _infoText =
            'Acima do Peso! - Obesidade Grau I (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 30.0 && imc <= 39.9) {
        _infoText = 'Obesidade! - Grau II\n(${imc.toStringAsPrecision(3)})';
      } else if (imc >= 40) {
        _infoText =
            'Obesidade Grave! - Obesidade Grau III\n(${imc.toStringAsPrecision(3)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        centerTitle: true,
        title: const Text(
          'Calculadora de IMC',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF6497b1),
        actions: <Widget>[
          IconButton(onPressed: resetFields, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: SizedBox(
                height: 140,
                width: 300,
                child:
                    Image.asset('assets/images/imc.png', fit: BoxFit.contain),
              ),
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Color(0xFF6497b1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Color(0xFF6497b1)),
                ),
                labelText: 'Peso (kg)',
                labelStyle: const TextStyle(color: Color(0xFF6497b1)),
              ),
              style: const TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Color(0xFF6497b1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Color(0xFF6497b1)),
                ),
                labelText: 'Altura (m)',
                labelStyle: const TextStyle(color: Color(0xFF6497b1)),
              ),
              style: const TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: calculate,
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF6497b1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text(
                  'Calcular',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF6497b1), fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
