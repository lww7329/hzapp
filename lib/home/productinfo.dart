import 'package:flutter/material.dart';
import 'package:hzapp/model/product.dart';

class productinfo extends StatefulWidget {
  product p;
  productinfo(product p) {
    this.p = p;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new productinfoStatus();
  }
}

class productinfoStatus extends State<productinfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: <Widget>[
                new Text(widget.p.name,
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ],
            )),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Row(children: <Widget>[
            Container(
              width: 50,
              child: Row(
                children: <Widget>[
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: widget.p.income.toString(),
                        style:
                            TextStyle(fontSize: 16, color: Colors.blueAccent)),
                    TextSpan(
                        text: "%",
                        style:
                            TextStyle(fontSize: 10, color: Colors.blueAccent))
                  ]))
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 130),
                child: Container(
                  alignment: Alignment.centerLeft,
//                  color: Colors.blueAccent,
                  width: 80,
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: widget.p.duration.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                    TextSpan(
                        text: widget.p.durationUnit,
                        style: TextStyle(fontSize: 10, color: Colors.black))
                  ])),
                )),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                        colors: [Colors.black12, Colors.black12]),
                  ),
                  child: Container(
                      width: 50,
                      height: 20,
                      child: Center(
                        child: Text(
//                          widget.p.status.toString(),
                          "回款中",
                          style: TextStyle(fontSize: 10, color: Colors.black26),
                        ),
                      )),
                ))
          ]),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Row(
            children: <Widget>[
              Container(width: 120,child:Text(
                "借款协议约定的利率",
                style: TextStyle(fontSize: 10, color: Colors.black26),
              ) ,),
              Padding(
                padding: EdgeInsets.only(left: 60),
                child: Text(
                  "期限",
                  style: TextStyle(fontSize: 10, color: Colors.black26),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Row(
            children: <Widget>[
              Text(
                "借款金额",
                style: TextStyle(fontSize: 10, color: Colors.black38),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    width: 80,
                    child: Text(
                      widget.p.totalAmount.toString() + "元",
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                  )),
              Container(
                width: 170,
                height: 3,
                color: Colors.blueAccent,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.orange[700]]),
                  ),
                  position: DecorationPosition.foreground,
                  child: Container(
                    width: 10,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  widget.p.progress.toString() + "%",
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: new Container(
            height: 1,
            width: MediaQuery.of(context).size.width - 10,
            color: Colors.black12,
          ),
        )
      ],
    );
  }
}
