import 'package:concurrente/src/screens/auth/widgets/login_form.dart';
import 'package:concurrente/src/widgets/fake_taxi_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  String buttonTitle = 'Get Started';
  bool hideForm = true;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animation = Tween<double>(begin: 0, end: -200).animate(animationController)
      ..addListener(() {
        setState(() {
          buttonTitle = 'Log In';
          if (animation.isCompleted) {
            print('show');
            hideForm = false;
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                  child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0.0, animation.value),
                    child: PlatformText(
                      'Fake Taxi',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              )),
            ),
            Offstage(
              offstage: hideForm,
              child: LoginForm(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FakeTaxiButton(
                title: buttonTitle,
                onPressed: () {
                  setState(() {
                    animationController.forward();
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
