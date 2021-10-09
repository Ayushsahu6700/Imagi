import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imagi2/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black54, blurRadius: 10.0),
                      ],
                    ),
                    child: Image.asset(
                      'images/bg.png',
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 13,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black54, blurRadius: 10.0),
                          ],
                          borderRadius: BorderRadius.circular(65.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          radius: 65.0,
                          backgroundImage: AssetImage('images/myimgage.jpg'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Ayush Sahu",
                      style: TextStyle(
                          fontFamily: 'Oswald Semi Bold',
                          fontSize: 25.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "PreFinal year student at IIIT Sonepat |",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Flutter Developor | Competitive Programmmer",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 350.0,
                      child: Divider(
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "Engineering Student with excellent problrm solving skills and ability to perform well in a team. Pssionate about coding and learning new things.",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Skills: Flutter | C++ | Data Structures and Algorithms | Git and Github",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Divider(
                              thickness: 1.5,
                              color: Colors.blue,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Links",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Divider(
                              thickness: 1.5,
                              color: Colors.blue,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Image.asset(
                            'images/lk.png',
                            height: 40,
                            width: 40,
                          ),
                          onTap: () {
                            launch(
                                "https://www.linkedin.com/in/ayush-sahu-6482a8169");
                          },
                        ),
                        GestureDetector(
                          child: Image.asset(
                            'images/ig.png',
                            height: 40,
                            width: 40,
                          ),
                          onTap: () {
                            launch(
                                "https://www.instagram.com/invites/contact/?i=1k26jc5qkupi5&utm_content=biriqiq");
                          },
                        ),
                        GestureDetector(
                          child: Image.asset(
                            'images/gh.png',
                            height: 40,
                            width: 40,
                          ),
                          onTap: () {
                            launch("https://github.com/Ayushsahu6700");
                          },
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
