import 'package:flutter/material.dart';

class AboutImagi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bcg.jpg"), fit: BoxFit.cover),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Aim",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 3.0,
                      fontSize: 50,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Image.asset(
                      "images/goal.png",
                      height: 55,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                        "Imagi is a wallpaper having meme generator functionality and to provide most immersive and comfortable interface to our users.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "It provides seamless browsing , viewing as well as downloading of differnt wallpaper amongst different categories with a great ease. It also provides functionality of making meme(adding funny text) in any image and saving it on your device.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
