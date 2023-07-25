import 'package:flutter/material.dart';

class LargeButtom extends StatelessWidget {
  final String textButtom;
  final Color colorButtom;
  final Function()? onPressed;
  LargeButtom({
    Key? key,
    required this.textButtom,
    required this.colorButtom,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(textButtom),
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              backgroundColor: colorButtom,
              padding: EdgeInsets.all(18)),
        ),
      ),
    );
  }
}
