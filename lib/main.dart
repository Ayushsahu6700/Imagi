import 'package:flutter/material.dart';
import 'package:imagi2/views/homescreen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: HomeScreen(),
      duration: 3500,
      imageSize: 150,
      imageSrc: "images/logo.png",
      text: "IMAGI",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 70.0,
        fontFamily: 'Monoton',
        fontWeight: FontWeight.w100,
        letterSpacing: 10,
      ),
      colors: [
        Colors.blueAccent,
        Colors.purple,
        Colors.yellow,
        Colors.redAccent,
      ],
      backgroundColor: Colors.black,
    );
  }
}
