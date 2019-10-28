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

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    
    animation = Tween<double>(begin: 0, end: -200).animate(animationController)
    ..addListener(() {
      setState(() {
        buttonTitle = 'Log In';
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
            Align(
              alignment: Alignment.bottomCenter,
              child: FakeTaxiButton(
                title: buttonTitle,
                onPressed: () {
                  setState(() {
                    print('hola');
                    animationController.forward();
                    // offsetY = -200;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
