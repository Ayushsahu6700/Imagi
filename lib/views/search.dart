import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:imagi2/data/data.dart';
import 'package:imagi2/model/wallpaper_model.dart';
import 'package:imagi2/widgets/widgets.dart';

class Search extends StatefulWidget {
  final String searchQuery;
  Search({this.searchQuery});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Widget appBarTItle = brandName();
  Icon actionIcon = Icon(Icons.search);
  TextEditingController searchController = TextEditingController();
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
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: appBarTItle,
        centerTitle: true,
        actions: [
          new IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (this.actionIcon.icon == Icons.search) {
                    this.actionIcon = Icon(Icons.close);
                    this.appBarTItle = TextField(
                      controller: searchController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          prefixIcon: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Search(
                                            searchQuery: searchController.text,
                                          )));
                            },
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          hintText: "Search Wallpapers... ",
                          hintStyle: TextStyle(color: Colors.white)),
                    );
                  } else {
                    this.actionIcon = Icon(Icons.search);
                    this.appBarTItle = brandName();
                  }
                });
              })
        ],
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
