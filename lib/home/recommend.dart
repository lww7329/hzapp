import 'package:flutter/material.dart';
class recommend extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(color: Colors.black12,child: Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10),child: new Container(width: 8,height: 20,color: Colors.lightBlue,),),
          Padding(padding: EdgeInsets.only(left: 0),child: Text("为您推荐",style: TextStyle(fontSize: 12,color: Colors.black),),),
          Container(alignment: Alignment.centerRight,width: MediaQuery.of(context).size.width-90,child: Text("市场有风险，出借需谨慎",style: TextStyle(fontSize: 10,color: Colors.black26),),)
        ],
      ),);

  }
}