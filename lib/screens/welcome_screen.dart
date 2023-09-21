import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatapp/component/round_button.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  var animationController;
  var animation;

  @override
  void initState() {
// with color max value is 1 >> upperBound: 1
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
      upperBound: 1,
    );
    // animation = CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    animation = ColorTween(begin: Colors.lightBlue, end: Colors.white)
        .animate(animationController);
    animationController.forward();
    animationController.addListener(
      () {
        setState(() {});
        print(animation.value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 60.0,
                  child: Image.asset('images/logo.png'),
                ),
                Hero(
                  tag: 'logo',
                  // ignore: deprecated_member_use
                  child: TypewriterAnimatedTextKit(
                    speed: const Duration(milliseconds: 1000),
                    text: const ['Flash Chat'],
                    textStyle: const TextStyle(
                      fontSize: 45.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                colour: Colors.lightBlueAccent,
                title: 'Log In',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
                colour: Colors.blueAccent,
                title: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
