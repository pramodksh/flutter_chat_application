import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_flutter/main.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import '../components/rounded_button.dart';
import 'login_screen.dart';



class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  int animationDuration = 2;

  // TODO: Customize Animation

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(seconds: animationDuration));
    animation = ColorTween(begin: Colors.black26, end: Colors.white)
        .animate(controller!);
    // Animation animation = CurvedAnimation(parent: controller!, curve:Curves.decelerate);

    controller?.forward();
    // controller?.reverse(from: 100);

    controller?.addListener(() {
      // print((animation.value * 100).toInt());
      // print(animation?.value);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation?.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Flash Chat'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              buttonText: 'Log In',
              routeName: LoginScreen.id,
              buttonColor: Colors.blue,
            ),
            RoundedButton(
              buttonText: 'Register',
              routeName: RegistrationScreen.id,
              buttonColor: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }
}
