import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FakeTaxiButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function onPressed;

  FakeTaxiButton({this.color, @required this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: ButtonTheme(
          minWidth: double.infinity,
          height: 50,
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Color.fromRGBO(247, 197, 32, 1),
            textColor: Colors.black,
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onPressed: onPressed,
          ),
        ));
  }
}
