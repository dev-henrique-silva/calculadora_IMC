import 'package:calculadora_IMC/controllers/home_controller.dart';
import 'package:calculadora_IMC/widgets/large-buttom.dart';
import 'package:calculadora_IMC/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_IMC/utils/keys.dart';

class CalculadoraIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _focusNodeName = FocusNode();
  final _focusNodeWeight = FocusNode();
  final _focusNodeHeight = FocusNode();

  final _formKeyWeight = GlobalKey<FormState>();
  final _formKeyHeight = GlobalKey<FormState>();

  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key(Keys.scaffoldHomeView),
      appBar: AppBar(
        title: Text("Cálculo IMC"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Logo(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                key: Key(Keys.textFormFieldName),
                focusNode: _focusNodeName,
                controller: _controller.textControllerName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Digite seu Nome...",
                  labelText: "Nome",
                ),
                onFieldSubmitted: (value) {
                  _focusNodeWeight.requestFocus();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKeyWeight,
                child: TextFormField(
                  key: Key(Keys.textFormFieldWeight),
                  inputFormatters: [_controller.maskWeight],
                  focusNode: _focusNodeWeight,
                  controller: _controller.textControllerWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Ex: 81.5",
                    labelText: "Peso *",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "É necessário preencher o campo peso";
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    _focusNodeHeight.requestFocus();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKeyHeight,
                child: TextFormField(
                  key: Key(Keys.textFormFieldHeight),
                  inputFormatters: [_controller.maskHeight],
                  focusNode: _focusNodeHeight,
                  controller: _controller.textControllerHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Ex: 1.86",
                    labelText: "Altura *",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "É necessário preencher o campo altura";
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    _focusNodeHeight.unfocus();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            LargeButtom(
              key: Key(Keys.buttonCalculate),
              textButtom: "Calcular",
              colorButtom: Colors.blue,
              onPressed: () {
                if ((_formKeyWeight.currentState!.validate() &&
                    _formKeyHeight.currentState!.validate())) {
                  _controller.calculateIMC();
                  _controller.getResult();
                  _controller.showDialog(context);
                }
              },
            ),
            LargeButtom(
              key: Key(Keys.buttonClear),
              textButtom: "Limpar",
              colorButtom: Colors.deepOrangeAccent,
              onPressed: () {
                _controller.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
