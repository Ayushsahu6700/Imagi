import 'package:flutter/material.dart';
import 'package:imagi2/extras/myprofile.dart';
import 'package:imagi2/mememaker/MemePage.dart';
import 'aboutus.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  void initState() {
    super.initState();
    img = greetingimg();
  }

  int img;
  String greetingMessage() {
    var timeNow = DateTime.now().hour;
    if (timeNow <= 12) {
      return 'Good Morning';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  int greetingimg() {
    var timeNow = DateTime.now().hour;
    if (timeNow <= 12) {
      return 1;
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 2;
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 3;
    } else {
      return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      image: DecorationImage(
                        image: AssetImage('images/$img.jpg'),
                        fit: BoxFit.cover,
                      )),
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            greetingMessage(),
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                    blurRadius: 5.0,
                                    color: Colors.black,
                                    offset: Offset(5.0, 5.0))
                              ],
                              fontFamily: 'Pacifico',
                              color: Colors.white,
                              fontSize: 30.0,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 100.0,
                        ),
                        SizedBox(
                          width: 300.0,
                          child: TyperAnimatedTextKit(
                            speed: Duration(milliseconds: 100),
                            text: [
                              "It is not enough to do your best,",
                              "you must know what to do,",
                              "and then do your best",
                              "- W.Edwards Deming",
                            ],
                            textStyle: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Pacifico',
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          children: [
                            ListTile(
                              tileColor: Colors.white,
                              leading: Icon(
                                Icons.edit,
                                color: Colors.red,
                                size: 30,
                              ),
                              title: Text(
                                'MEME MAKER',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MemePage();
                                }));
                              },
                            ),
                            ListTile(
                              tileColor: Colors.white,
                              leading: Icon(
                                Icons.people,
                              ),
                              title: Text(
                                'About Us',
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AboutUs();
                                }));
                              },
                            ),
                            ListTile(
                              tileColor: Colors.white,
                              leading: Icon(
                                Icons.home,
                                color: Colors.blue,
                              ),
                              title: Text(
                                'Home',
                                style: TextStyle(color: Colors.blue),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   width: double.infinity,
                //   height: 275.0,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
