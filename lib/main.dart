import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importe o pacote intl

void main() {
  runApp(FreightCalculatorApp());
}

class FreightCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FreightCalculatorScreen(),
    );
  }
}

class FreightCalculatorScreen extends StatefulWidget {
  @override
  _FreightCalculatorScreenState createState() =>
      _FreightCalculatorScreenState();
}

class _FreightCalculatorScreenState extends State<FreightCalculatorScreen> {
  final TextEditingController volumeController = TextEditingController();
  final TextEditingController comprimentoController = TextEditingController();
  final TextEditingController larguraController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController valorNFController = TextEditingController();
  String valorFrete1 = "";
  String valorFrete2 = "";
  String valorFrete3 = "";
  String cubagem = "";

  // Função para corrigir o separador decimal
  String corrigirSeparadorDecimal(String valor) {
    return valor.replaceAll(',', '.'); // Substitui vírgulas por pontos
  }

  void calcularFrete() {
    // Corrige os separadores decimais antes de converter para double
    double comprimento =
        double.tryParse(corrigirSeparadorDecimal(comprimentoController.text)) ??
            0;
    double largura =
        double.tryParse(corrigirSeparadorDecimal(larguraController.text)) ?? 0;
    double altura =
        double.tryParse(corrigirSeparadorDecimal(alturaController.text)) ?? 0;
    double peso =
        double.tryParse(corrigirSeparadorDecimal(pesoController.text)) ?? 0;
    double valorNF =
        double.tryParse(corrigirSeparadorDecimal(valorNFController.text)) ?? 0;

    double volume = comprimento * largura * altura;

    double valorFreteNF = (valorNF * 0.025) * 1.07;
    double valorFretePeso = (peso * 1.222) * 1.07;
    double valorFreteVolume = ((volume * 300) * 1.222) * 1.07;

    double maiorValor = [valorFreteNF, valorFretePeso, valorFreteVolume]
        .reduce((a, b) => a > b ? a : b);
    double valorFinal = maiorValor >= 138 ? maiorValor : 138;

    // Formatação monetária
    final formatador = NumberFormat.currency(
      locale: 'pt_BR', // Define o local como Brasil
      symbol: 'R\$', // Símbolo da moeda
      decimalDigits: 2, // Número de casas decimais
    );

    setState(() {
      if (valorFinal > 138) {
        if (volume == 0) {
          cubagem = "";
        } else {
          cubagem = "Cubagem: ${formatador.format(volume)} M³";
        }

        valorFrete1 = "Valor do Frete: ${formatador.format(valorFinal)}";
        valorFrete2 =
            "Valor do Frete (5% +): ${formatador.format(valorFinal * 1.05)}";
        valorFrete3 =
            "Valor do Frete (5% -): ${formatador.format(valorFinal * 0.95)}";
      } else {
        if (volume == 0) {
          cubagem = "";
        } else {
          cubagem = "Cubagem: ${formatador.format(volume)} M³";
        }
        valorFrete1 = "Valor do Frete: ${formatador.format(valorFinal)}";
        valorFrete2 = "";
        valorFrete3 = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                "Calculadora de Frete",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Icon(Icons.local_shipping_rounded, size: 200),
              TextField(
                controller: valorNFController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Valor da NF (R\$)",
                    hintText: "Ex: R\$1.500",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14))),
              ),
              SizedBox(height: 20),
              TextField(
                controller: pesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (Kg)",
                    hintText: "Ex: 10",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14))),
              ),
              SizedBox(height: 20),
              TextField(
                controller: comprimentoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Comprimento (m)",
                    hintText: "Ex: 0.5",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14))),
              ),
              SizedBox(height: 20),
              TextField(
                controller: larguraController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Largura (m)",
                    hintText: "Ex: 0.5",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14))),
              ),
              SizedBox(height: 20),
              TextField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (m)",
                    hintText: "Ex: 0.5",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14))),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calcularFrete,
                child: Text(
                  "Calcular Frete",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.1,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              Text(cubagem,
                  style: TextStyle(
                      fontSize: max(20,
                          min(MediaQuery.of(context).size.width * 0.05, 30)),
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                  textAlign: TextAlign.center),
              Text(valorFrete1,
                  style: TextStyle(
                      fontSize: max(20,
                          min(MediaQuery.of(context).size.width * 0.05, 30)),
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                  textAlign: TextAlign.center),
              Text(valorFrete2,
                  style: TextStyle(
                      fontSize: max(20,
                          min(MediaQuery.of(context).size.width * 0.05, 30)),
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                  textAlign: TextAlign.center),
              Text(
                valorFrete3,
                style: TextStyle(
                    fontSize: max(
                        20, min(MediaQuery.of(context).size.width * 0.05, 30)),
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
