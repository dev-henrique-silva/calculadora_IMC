import 'package:calculadora_IMC/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calcular resulatado', () {
    var getResult = {
      {HomeController().resultImc < 16}: "Magreza Grave",
      {HomeController().resultImc >= 16 && HomeController().resultImc < 17}: "Magreza Moderada",
      {HomeController().resultImc >= 17 && HomeController().resultImc < 18.5}: "Magreza Leve",
      {HomeController().resultImc >= 18.5 && HomeController().resultImc < 25}: "Saudável",
      {HomeController().resultImc >= 25 && HomeController().resultImc < 30}: "Sobrepeso",
      {HomeController().resultImc >= 30 && HomeController().resultImc < 35}: "Obesidade Grau I",
      {HomeController().resultImc >= 35 && HomeController().resultImc < 40}: "Obesidade Grau II",
      {HomeController().resultImc >= 40}: "Obesidade Grau III",
    };

    getResult.forEach((value, expects) {
      test('comparar resultado', () {
        expect(HomeController().getResult(), equals(expects));
      });
    });
  });
}
