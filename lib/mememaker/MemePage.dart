import 'dart:io';
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MemePage extends StatefulWidget {
  @override
  _MemePageState createState() => _MemePageState();
}

class _MemePageState extends State<MemePage> {
  final GlobalKey globalKey = GlobalKey();
  String headerText = "";
  String footerText = "";
  File _image;
  File _imageFile;
  bool imageSelected = false;
  Random rng = Random();
  Future getImage() async {
    var image;
    try {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    } catch (platformException) {
      print("not allowing " + platformException);
    }
    setState(() {
      if (image != null) {
        imageSelected = true;
      } else {}
      _image = image;
    });
    new Directory('storage/emulated/0/' + 'MemeGenerator')
        .create(recursive: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: ColorizeAnimatedTextKit(
          text: [
            "MEMEMAKER",
          ],
          speed: Duration(milliseconds: 400),
          totalRepeatCount: 500,
          textStyle: TextStyle(
            fontSize: 30.0,
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
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(color: Colors.black54, blurRadius: 10.0),
                  ],
                ),
                child: Image.asset(
                  "images/meme.png",
                  height: MediaQuery.of(context).size.height / 11,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              RepaintBoundary(
                key: globalKey,
                child: Stack(
                  children: [
                    _image != null
                        ? Center(
                            child: Image.file(
                              _image,
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Container(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              headerText.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 3.0,
                                    color: Colors.black87,
                                  ),
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 8.0,
                                    color: Colors.black87,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                footerText.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 3.0,
                                      color: Colors.black87,
                                    ),
                                    Shadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 8.0,
                                      color: Colors.black87,
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              imageSelected
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (val) {
                              setState(() {
                                headerText = val;
                              });
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: "Header Text",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          TextField(
                            onChanged: (val) {
                              setState(() {
                                footerText = val;
                              });
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: "Footer Text",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              //TODO
                              takeScreenshot();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Save",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      child: Center(
                        child: Text(
                          "Select image to get started",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              _imageFile != null ? Image.file(_imageFile) : Container(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImage();
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  takeScreenshot() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    print(pngBytes);
    File imgFile = new File('$directory/screenshot${rng.nextInt(200)}.png');
    setState(() {
      _imageFile = imgFile;
    });
    _savefile(_imageFile);
    //saveFileLocal();
    imgFile.writeAsBytes(pngBytes);
  }

  _savefile(File file) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(await file.readAsBytes()));
      print(result);
    }
  }
}
