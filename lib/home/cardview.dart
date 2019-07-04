import 'package:flutter/material.dart';

class cardview extends StatefulWidget {
  String imagename;
  String title;
  String content;
  cardview(String imagename, String title, String content) {
    this.imagename = imagename;
    this.title = title;
    this.content = content;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new cardviewStatus();
  }
}

class cardviewStatus extends State<cardview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement buildncard2@3x.png
    return DecoratedBox(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10.0), //10像素圆角
                boxShadow: [
              //阴影
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(3.0, 3.0),
                  blurRadius: 5.0)
            ]),
        child: Container(
            alignment: Alignment.center,
            height: 100,
            width: 150,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child:
                      Image(image: AssetImage(widget.imagename), width: 50.0),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                      Text(
                        widget.content,
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}


class mycardview extends StatelessWidget{
  List imagenameList = [
    "images/ncard1.png",
    "images/ncard2.png",
    "images/ncard3.png"
  ];
  List titleList = ["平台介绍", "新手指引", "运营数据"];
  List contentList = ["大格局情服务", "让出借更简单", "动态尽在掌握"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 120,
        color: Colors.black26,
        child: SingleChildScrollView(
//              padding: EdgeInsets.all(10.0),
            scrollDirection: Axis.horizontal,
            child:  Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Row(children: [
                  new cardview(
                      imagenameList[0], titleList[0], contentList[0]),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: new cardview(
                        imagenameList[1], titleList[1], contentList[1]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: new cardview(
                        imagenameList[2], titleList[2], contentList[2]),
                  ),
                ]),
              ),
            )));
  }
}