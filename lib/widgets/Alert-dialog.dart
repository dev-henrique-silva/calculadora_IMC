import 'package:calculadora_IMC/widgets/large-buttom.dart';
import 'package:calculadora_IMC/widgets/logo.dart';
import 'package:calculadora_IMC/utils/keys.dart';
import 'package:flutter/material.dart';

class ResultDialog {
  alertDialog(
    BuildContext context,
    String userName,
    String imcResult,
    String titleResult,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        key: Key(Keys.AlertDialogResult),
        content: Container(
          height: MediaQuery.of(context).size.height * 0.80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Logo(),
              Text(
                userName,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
              ),
              Text('O resultado do seu IMC é:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23)),
              Text(
                imcResult,
                style: TextStyle(fontSize: 90, fontWeight: FontWeight.w900),
              ),
              Text(
                titleResult,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
              LargeButtom(
                key: Key(Keys.buttonRecalculate),
                textButtom: "Recalcular",
                colorButtom: Colors.blueGrey,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
