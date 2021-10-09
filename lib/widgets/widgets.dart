import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:imagi2/model/wallpaper_model.dart';
import 'package:imagi2/views/Image_view.dart';

Widget brandName() {
  return ColorizeAnimatedTextKit(
    text: [
      "IMAGI",
    ],
    speed: Duration(milliseconds: 400),
    totalRepeatCount: 500,
    textStyle: TextStyle(
      fontSize: 40.0,
      fontFamily: 'Monoton',
      fontWeight: FontWeight.w100,
      letterSpacing: 7,
    ),
    colors: [
      Colors.purple,
      Colors.blue,
      Colors.red,
      Colors.yellow,
    ],
    textAlign: TextAlign.start,
  );
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ImageView(imgUrl: wallpaper.src.portrait)));
            },
            child: Hero(
              tag: wallpaper.src.portrait,
              child: Container(
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      wallpaper.src.portrait,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
