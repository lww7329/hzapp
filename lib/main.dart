import 'package:flutter/material.dart';
import 'package:hzapp/home/homeview.dart';
import 'package:hzapp/home/productinfo.dart';
import 'package:hzapp/products/products.dart';
import 'package:dio/dio.dart';
import 'package:hzapp/paramvalues.dart';
import 'dart:io';
import 'dart:convert';
import 'package:hzapp/model/banner.dart';
import 'package:hzapp/model/product.dart';
import 'package:hzapp/discover/discover.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new ScaffoldRoute(),
    ));

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State with SingleTickerProviderStateMixin {
  int _selectIndex = 0;
  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();
  PageController _pageController;
  List tabs = ["首页", "标的", "发现"];
  List<banner> bannerList = [];
  List<product> productList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _selectIndex);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text(tabs[_selectIndex]),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {})
        ],
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return homeview();
          } else if (index == 1) {
            return products();
          } else {
            return discover();
          }
        },
        controller: _pageController,
        itemCount: tabs.length,
        onPageChanged: (int index) {
          setState(() {
            _selectIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text("标的")),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text("发现")),
        ],
        currentIndex: _selectIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTap,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAdd,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onItemTap(int index) {
    setState(() {
      _selectIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
      print(index);
    });
  }

  void _onAdd() {
    print("Add");
  }
}
