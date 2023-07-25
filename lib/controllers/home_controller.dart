import 'package:calculadora_IMC/models/person_model.dart';
import 'package:calculadora_IMC/widgets/Alert-dialog.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeController {
  TextEditingController? textControllerName;
  TextEditingController? textControllerWeight;
  TextEditingController? textControllerHeight;

  dynamic maskWeight;
  dynamic maskHeight;

  late double resultImc;
  late String titleResult;
  late ResultDialog resultDialog;

  late PersonModel personModel;

  HomeController() {
    textControllerName = TextEditingController(text: "");
    textControllerWeight = TextEditingController(text: "");
    textControllerHeight = TextEditingController(text: "");

    maskWeight = MaskTextInputFormatter(mask: "##.#");
    maskHeight = MaskTextInputFormatter(mask: "#.##");

    resultDialog = ResultDialog();
  }

  calculateIMC() {
    if (textControllerWeight!.text.isNotEmpty && textControllerHeight!.text.isNotEmpty) {
      personModel = PersonModel(
          name: textControllerName!.text,
          weight: double.parse(textControllerWeight!.text),
          height: double.parse(textControllerHeight!.text));

      resultImc = personModel.weight / (personModel.height * personModel.height);
    }
  }

  getResult() {
    if (resultImc < 16) {
      titleResult = "Magreza Grave";
    } else if (resultImc >= 16 && resultImc < 17) {
      titleResult = "Magreza Moderada";
    } else if (resultImc >= 17 && resultImc < 18.5) {
      titleResult = "Magreza Leve";
    } else if (resultImc >= 18.5 && resultImc < 25) {
      titleResult = "Saudável";
    } else if (resultImc >= 25 && resultImc < 30) {
      titleResult = "Sobrepeso";
    } else if (resultImc >= 30 && resultImc < 35) {
      titleResult = "Obesidade Grau I";
    } else if (resultImc >= 35 && resultImc < 40) {
      titleResult = "Obesidade Grau II";
    } else if (resultImc >= 40) {
      titleResult = "Obesidade Grau III";
    }
  }

  showDialog(BuildContext context) {
    resultDialog.alertDialog(
        context, personModel.name.toString(), resultImc.toStringAsFixed(1), titleResult);
  }

  clear() {
    textControllerName!.text = "";
    textControllerWeight!.text = "";
    textControllerHeight!.text = "";
  }
}
