import 'package:flutter/material.dart';
import 'package:hzapp/discover/disview.dart';
class discover extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new discoverState();
  }
}

class discoverState extends State{
  List nameList=["images/discover1.png","images/discover2.png","images/discover3.png","images/discover4.png","images/discover5.png","images/discover6.png"];
  List titleList=["信息披露","资费说明","发展历程","法律法规","风险小讲堂","微信公众号"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //每行三列
        childAspectRatio: 1.0 //显示区域宽高相等
    ), itemBuilder: (context,index){
      return disview(nameList[index],titleList[index]);
    },itemCount: 6,padding: EdgeInsets.only(top: 20),);
  }
}