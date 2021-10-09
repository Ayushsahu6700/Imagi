import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:imagi2/data/data.dart';
import 'package:imagi2/model/catagories_model.dart';
import 'package:imagi2/model/wallpaper_model.dart';
import 'package:imagi2/views/catagories.dart';
import 'package:imagi2/views/search.dart';
import 'package:imagi2/widgets/widgets.dart';
import '../extras/drawer.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget appBarTItle = brandName();
  bool _loading = true;
  Icon actionIcon = Icon(Icons.search);
  List<CategoriesModel> categories = [];
  List<WallpaperModel> wallpapers = [];
  TextEditingController searchController = TextEditingController();

  getTrendingWallpapers() async {
    var url = Uri.parse("https://api.pexels.com/v1/curated?per_page=16&page=1");
    var response = await http.get(url, headers: {"Authorization": apiKey});
    print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getTrendingWallpapers();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      drawer: MainDrawer(),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                color: Colors.black87,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Row(
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoriesTile(
                            title: categories[index].categoriesName,
                            imgUrl: categories[index].imgUrl,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Row(
                        children: [
                          Text(
                            'Samples',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    wallpapersList(wallpapers: wallpapers, context: context),
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrl, title;
  CategoriesTile({this.title, this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Categorie(categorieName: title.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrl,
                height: 150,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
              ),
              height: 180,
              width: 300,
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
