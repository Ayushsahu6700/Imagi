import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imagi2/data/data.dart';
import 'package:imagi2/model/wallpaper_model.dart';
import 'package:imagi2/widgets/widgets.dart';

class Categorie extends StatefulWidget {
  final String categorieName;
  Categorie({this.categorieName});
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<WallpaperModel> wallpapers = [];
  getSearchWallpapers(String query) async {
    var url =
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=16");
    var response = await http.get(url, headers: {"Authorization": apiKey});
    print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      // print(element);
      WallpaperModel wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getSearchWallpapers(widget.categorieName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black87,
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
