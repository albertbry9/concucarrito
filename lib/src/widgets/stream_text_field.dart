import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StreamTextField extends StatelessWidget {
  final Stream stream;
  final String placeholder;
  final bool isObscureText;
  final TextInputType inputType;
  final Function onChanged;

  StreamTextField(
      {@required this.stream,
      @required this.placeholder,
      @required this.isObscureText,
      @required this.inputType,
      @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: inputType,
            decoration: InputDecoration(
                hintText: placeholder,
                errorText: snapshot.hasError ? snapshot.error : null),
            onChanged: onChanged,
            obscureText: isObscureText,
          );
        });
  }
}
