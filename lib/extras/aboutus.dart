import 'package:flutter/material.dart';
import 'myprofile.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'AboutImagi.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: ColorizeAnimatedTextKit(
            text: [
              "ABOUT US",
            ],
            speed: Duration(milliseconds: 400),
            totalRepeatCount: 500,
            textStyle: TextStyle(
              fontSize: 35.0,
              fontFamily: 'Monoton',
              fontWeight: FontWeight.w100,
              letterSpacing: 4,
            ),
            colors: [
              Colors.purple,
              Colors.blue,
              Colors.red,
              Colors.yellow,
            ],
            textAlign: TextAlign.start,
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'IMAGI',
              ),
              Tab(
                text: 'DEVELOPER',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AboutImagi(),
            MyProfile(),
          ],
        ),
      ),
    );
  }
}
