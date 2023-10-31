/*Aplicación que calcula el salario total de un vendedor según sus ventas, y se clasifica
según el valor de las ventas en 4 tipos de salario:
Bronce:Si las ventas son menores que 500.000 y solo gana el salario base.
Plata: Si las ventas son 500.000 o mas, y menores que 2000.000 gana salario base + 10% de las ventas
Oro:Si las ventas son 2000.000 o mas, y menores que 4000.000 gana salario base + 15% de las ventas
Elite: Si las ventas son 4000.000 o mas, gana salario base + 10% de las ventas
 */
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salario de los vendedores',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Salario de los vendedores'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _salariobase = TextEditingController();
  final _valorventas = TextEditingController();
  double _salariototal = 0;
  String _mensaje = "";

  void _calcularSalario() {
    setState(() {
      if (double.parse(_valorventas.text) < 500000) {
        _salariototal = double.parse(_salariobase.text);
        _mensaje = "Tipo de salario: Bronce";
      } else if (double.parse(_valorventas.text) >= 500000 &&
          double.parse(_valorventas.text) < 2000000) {
        _salariototal = double.parse(_salariobase.text) +
            (double.parse(_valorventas.text) * 0.1);
        _mensaje = "Tipo de salario: Plata";
      } else if (double.parse(_valorventas.text) >= 2000000 &&
          double.parse(_valorventas.text) < 4000000) {
        _salariototal = double.parse(_salariobase.text) +
            (double.parse(_valorventas.text) * 0.15);
        _mensaje = "Tipo de salario: Oro";
      } else {
        _salariototal = double.parse(_salariobase.text) +
            (double.parse(_valorventas.text) * 0.2);
        _mensaje = "Tipo de salario: Elite";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _salariobase,
                decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                      ),
                    ),
                    labelText: 'Ingrese su salario base'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _valorventas,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                      ),
                    ),
                    labelText: 'Ingrese el valor total de sus ventas'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  _calcularSalario();
                },
                label: const Text("Calcular"),
                icon: const Icon(Icons.add_circle,
                    size: 18, color: Colors.pinkAccent),
              ),
              Text(
                'Su salario total es: $_salariototal',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '$_mensaje',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
