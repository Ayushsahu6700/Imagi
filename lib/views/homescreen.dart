import 'package:flutter/material.dart';
import 'package:imagi2/extras/aboutus.dart';
import 'package:imagi2/extras/drawer.dart';
import 'package:imagi2/extras/myprofile.dart';
import 'package:imagi2/mememaker/MemePage.dart';
import '../extras/AboutImagi.dart';
import 'home.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: <Widget>[
          Home(),
          MemePage(),
          AboutUs(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        iconSize: 30.0,
        backgroundColor: Colors.black,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Wallpaper'),
              icon: Icon(Icons.home),
              activeColor: Colors.white,
              inactiveColor: Colors.amber),
          BottomNavyBarItem(
              title: Text(
                'Meme',
              ),
              icon: Icon(Icons.apps),
              activeColor: Colors.white,
              inactiveColor: Colors.blue),
          BottomNavyBarItem(
              title: Text('About Us'),
              icon: Icon(Icons.people),
              activeColor: Colors.white,
              inactiveColor: Colors.pink),
        ],
      ),
    );
  }
}
