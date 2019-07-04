import 'package:flutter/material.dart';
import 'package:hzapp/home/productinfo.dart';
import 'package:hzapp/model/product.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:hzapp/paramvalues.dart';

class products extends StatefulWidget {
//  List<product> productlist=[];
//  products(List<product> list){
//    this.productlist=list;
//  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new productsStatus();
  }
}

class productsStatus extends State<products> {
  List<product> productlist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestProduct();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == productlist.length) {
          if (index < 30) {
            _requestProduct();
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)),
            );
          } else {
              return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ));
          }
        }
        return productinfo(productlist[index]);
      },
      itemCount: productlist.length + 1,
      scrollDirection: Axis.vertical,
    );
  }

  void _requestProduct() async {

    Map banMap=json.decode('{"header":{"retCode":0,"retMsg":"success"},"body":{"pageSize":10,"isMore":1,"items":[{"bespokeType":0,"floatingIncome":0,"status":60,"borrowerUserId":"82c5576aa55540ed86c04aa35f816b37","duration":12,"payType":"按月付息到期还本","durationUnit":"个月","isAllowDebt":1,"remainAmount":0,"launchTime":1555572600000,"systemTime":1562032203048,"name":"QYD-19DAH001","type":5,"id":"77234ab9ce6b448fa0c4620f57e07287","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"1,000,000","income":9},{"bespokeType":0,"floatingIncome":0,"status":60,"borrowerUserId":"4637475c1465496fad9cba4999bef2b5","duration":3,"payType":"按月付息到期还本","durationUnit":"个月","isAllowDebt":0,"remainAmount":0,"launchTime":1555326000000,"systemTime":1562032203049,"name":"GRD-19DAE001","type":8,"id":"770d0cb11f1d4eba80af87981612e09d","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"180,000","income":7.5},{"bespokeType":0,"floatingIncome":0,"status":60,"borrowerUserId":"bd776b78a62d4c0a836a959c5fcff83f","duration":12,"payType":"按月付息到期还本","durationUnit":"个月","isAllowDebt":1,"remainAmount":0,"launchTime":1553675400000,"systemTime":1562032203050,"name":"YQB-19CBG001","type":5,"id":"056155e303314b6286b0695215904dfe","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"1,000,000","income":9},{"bespokeType":0,"floatingIncome":0,"status":60,"borrowerUserId":"8b70fb50ca464acebc5cfeba66ce139e","duration":12,"payType":"按月付息到期还本","durationUnit":"个月","isAllowDebt":1,"remainAmount":0,"launchTime":1553155200000,"systemTime":1562032203051,"name":"YQB-19CBA002","type":5,"id":"29faf39b34574ed4a65408fbe4ba0b97","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"1,000,000","income":9},{"bespokeType":0,"floatingIncome":0,"status":70,"borrowerUserId":"226179","duration":3,"payType":"到期还本付息","durationUnit":"个月","isAllowDebt":0,"remainAmount":0,"launchTime":1545631200000,"systemTime":1562032203052,"name":"AXB-18LBD001","type":6,"id":"151721","progress":100,"hotSale":0,"minMoney":100,"recommend":0,"totalAmount":"100","income":9},{"bespokeType":0,"floatingIncome":0,"status":70,"borrowerUserId":"226024","duration":3,"payType":"到期还本付息","durationUnit":"个月","isAllowDebt":0,"remainAmount":0,"launchTime":1536564600000,"systemTime":1562032203053,"name":"XYB-18IJ001","type":8,"id":"151664","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"170,000","income":9},{"bespokeType":0,"floatingIncome":0,"status":70,"borrowerUserId":"226038","duration":3,"payType":"到期还本付息","durationUnit":"个月","isAllowDebt":0,"remainAmount":0,"launchTime":1536301800000,"systemTime":1562032203053,"name":"XYB-18IG001","type":8,"id":"151663","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"130,000","income":9},{"bespokeType":0,"floatingIncome":0,"status":70,"borrowerUserId":"226025","duration":3,"payType":"到期还本付息","durationUnit":"个月","isAllowDebt":0,"remainAmount":0,"launchTime":1536222600000,"systemTime":1562032203054,"name":"XYB-18IF002","type":8,"id":"151662","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"120,000","income":9},{"bespokeType":0,"floatingIncome":0,"status":70,"borrowerUserId":"226041","duration":3,"payType":"到期还本付息","durationUnit":"个月","isAllowDebt":0,"remainAmount":0,"launchTime":1536201000000,"systemTime":1562032203055,"name":"XYB-18IF001","type":8,"id":"151661","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"120,000","income":9},{"bespokeType":0,"floatingIncome":0,"status":70,"borrowerUserId":"226046","duration":3,"payType":"到期还本付息","durationUnit":"个月","isAllowDebt":0,"remainAmount":0,"launchTime":1536127200000,"systemTime":1562032203056,"name":"XYB-18IE001","type":8,"id":"151660","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"160,000","income":9}],"totalNum":961,"currentPage":1,"totalPage":97,"startIndex":0}}');
    List list = banMap["body"]["items"];
    for (int i = 0; i < list.length; i++) {
      var ban = new product.fromJson(list[i]);
      productlist.add(ban);
    }
    Future.delayed(Duration(seconds: 1)).then((e) {
      setState(() {});
    });

  }
}
