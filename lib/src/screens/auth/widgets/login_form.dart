import 'package:concurrente/src/widgets/stream_text_field.dart';
import 'package:flutter/widgets.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(height: 5,),
          StreamTextField(
            inputType: TextInputType.emailAddress,
            isObscureText: false,
            placeholder: 'Email',
            stream: null,
            onChanged: null,
          ),
          Container(height: 25,),
          StreamTextField(
            inputType: TextInputType.emailAddress,
            isObscureText: true,
            placeholder: 'Password',
            stream: null,
            onChanged: null,
          )
        ],
      ),
    );
  }


}
