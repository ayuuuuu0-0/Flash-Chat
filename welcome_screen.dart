import 'package:flutter/material.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/Components/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = ColorTween(begin: Color(0xFF030831), end: Color(0xFF010811)).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
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
                Hero(
                  tag: 'logo',
                  child: Container(
                      height: 60.0,
                      child: Image.asset('images/logo.png'),
                    ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash chat',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Rajdhani',
                        color: Colors.white,
                      ),
                       speed: const Duration(milliseconds: 200),
                    ),
                  ],
                    totalRepeatCount: 1,
                  pause: Duration(milliseconds: 100),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
            colour: Color(0xff06f3cd),
                onPressed: (){
                Navigator.pushNamed(context, LoginScreen.id);
                },),
             RoundedButton(title: 'Register', colour: Colors.blueAccent, onPressed: (){Navigator.pushNamed(context, RegistrationScreen.id);}
             ),
          ],
        ),
      ),
    );
  }
}

