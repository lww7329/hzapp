import 'package:flutter/material.dart';
class disview extends StatefulWidget
{
  String name="";
  String title="";
  disview(String name,String title){
    this.name=name;
    this.title=title;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new disviewState();
  }
}

class disviewState extends State<disview>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 60,height: 60,child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: Image(
            image: AssetImage(widget.name),
            width: 30,
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
        Text(widget.title,style: TextStyle(fontSize: 12),)
      ],
    ));

  }
}