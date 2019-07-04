import 'package:flutter/material.dart';
import 'package:hzapp/home/transparentimage.dart';
import 'package:hzapp/home/recommend.dart';
import 'package:hzapp/home/cardview.dart';
import 'package:hzapp/products/products.dart';
import 'package:hzapp/model/banner.dart';
import 'package:hzapp/model/product.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import "package:hzapp/home/productinfo.dart";
import "package:hzapp/paramvalues.dart";
class homeview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new homeviewStatus();
  }
}

class homeviewStatus extends State<homeview> {
  List<BannerItem> bannerList = [];
  List imagenameList = [
    "images/ncard1.png",
    "images/ncard2.png",
    "images/ncard3.png"
  ];
  List titleList = ["平台介绍", "新手指引", "运营数据"];
  List contentList = ["大格局情服务", "让出借更简单", "动态尽在掌握"];
  List<int> intList = [0, 1, 2];
  List<banner> homebannerList = [];
  List<product>productList=[];




  @override
  void initState() {
    // TODO: implement initState
    _requestBannerData();
    _requestHomeProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return  BannerWidget(150, bannerList, bannerPress: (pos, item) {
              print('第 $pos 点击了');
            });
          } else if (index == 1) {
            return Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Image(
                      image: AssetImage("images/nnotices.png"), width: 10.0),
                ),
                Text(
                  "重庆大学、浙江大学、北京大学三所“双一流”高校",
                  style: TextStyle(fontSize: 12),
                )
              ],
            );
          } else if (index == 2) {
            return  mycardview();
          } else if (index == 3) {
            return  recommend();
          } else {
            return  productinfo(productList[index]);
          }
        });
  }

  void _requestBannerData() async {


    Map banMap=json.decode('{"header":{"retCode":0,"retMsg":"success"},"body":{"bannerInfoList":[{"linkUrl":"#","title":"日常banner图","imageUrl":"https://service.52touzi.cn/aa6948c8268c43cea8ef66ae816f56d7.jpg","logo":"https://service.52touzi.cn/067d36f38be44e9cafbf5bff0a5222a0.jpg"},{"linkUrl":"https://service.52touzi.cn/03ec2ed488c54fa3baa74ea412b73c7d.pdf","title":"五月运营报告","imageUrl":"https://service.52touzi.cn/277d1a11200240c19fd9ac1fda27a5da.jpg","logo":"https://service.52touzi.cn/13100ef490504d8b85dfb06f3aceaa76.jpg"},{"linkUrl":"http://app.52touzi.cn/view/message#/messageDetail/2339","title":"等保三级证书","imageUrl":"https://service.52touzi.cn/9e177d8b9eeb4f7483c17c5854d14092.jpg","logo":"https://service.52touzi.cn/1a8c225bf11c4b8e961410a199f22001.jpg"},{"linkUrl":"#","title":"警方反诈提示","imageUrl":"https://service.52touzi.cn/eb7dbf5f35114b1eb61b44aa4f05f8e3.jpg","logo":"https://service.52touzi.cn/0f14df8e7e7d44b1aac917810e21abb5.jpg"}],"announcement":[{"id":3205,"title":"存管银行系统升级通知"},{"id":3204,"title":"存管银行升级通知"},{"id":3203,"title":"存管业务的通知"},{"id":3202,"title":"中国人民银行支付系统维护通知"},{"id":3201,"title":"端午节放假通知"},{"id":3197,"title":"银行系统升级通知"}]}}');

    List list = banMap["body"]["bannerInfoList"];

    for (int i = 0; i < list.length; i++) {
      var ban = new banner.fromJson(list[i]);
      homebannerList.add(ban);
    }

    for (int i = 0; i < homebannerList.length; i++) {
      banner b = homebannerList[i];
      BannerItem item = BannerItem.defaultBannerItem(b.imageUrl, "新手指引");
      bannerList.add(item);
    }

    setState(() {});
  }


  void _requestHomeProductData() async {
    Map banMap=json.decode('{"header":{"retCode":0,"retMsg":"success"},"body":{"pageSize":10,"isMore":1,"items":[{"bespokeType":0,"floatingIncome":0,"status":60,"borrowerUserId":"82c5576aa55540ed86c04aa35f816b37","duration":12,"payType":"按月付息到期还本","durationUnit":"个月","isAllowDebt":1,"remainAmount":0,"launchTime":1555572600000,"systemTime":1562032203048,"name":"QYD-19DAH001","type":5,"id":"77234ab9ce6b448fa0c4620f57e07287","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"1,000,000","income":9},{"bespokeType":0,"floatingIncome":0,"status":60,"borrowerUserId":"4637475c1465496fad9cba4999bef2b5","duration":3,"payType":"按月付息到期还本","durationUnit":"个月","isAllowDebt":0,"remainAmount":0,"launchTime":1555326000000,"systemTime":1562032203049,"name":"GRD-19DAE001","type":8,"id":"770d0cb11f1d4eba80af87981612e09d","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"180,000","income":7.5},{"bespokeType":0,"floatingIncome":0,"status":60,"borrowerUserId":"bd776b78a62d4c0a836a959c5fcff83f","duration":12,"payType":"按月付息到期还本","durationUnit":"个月","isAllowDebt":1,"remainAmount":0,"launchTime":1553675400000,"systemTime":1562032203050,"name":"YQB-19CBG001","type":5,"id":"056155e303314b6286b0695215904dfe","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"1,000,000","income":9},{"bespokeType":0,"floatingIncome":0,"status":60,"borrowerUserId":"8b70fb50ca464acebc5cfeba66ce139e","duration":12,"payType":"按月付息到期还本","durationUnit":"个月","isAllowDebt":1,"remainAmount":0,"launchTime":1553155200000,"systemTime":1562032203051,"name":"YQB-19CBA002","type":5,"id":"29faf39b34574ed4a65408fbe4ba0b97","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"1,000,000","income":9},{"bespokeType":0,"floatingIncome":0,"status":70,"borrowerUserId":"226179","duration":3,"payType":"到期还本付息","durationUnit":"个月","isAllowDebt":0,"remainAmount":0,"launchTime":1545631200000,"systemTime":1562032203052,"name":"AXB-18LBD001","type":6,"id":"151721","progress":100,"hotSale":0,"minMoney":100,"recommend":0,"totalAmount":"100","income":9},{"bespokeType":0,"floatingIncome":0,"status":70,"borrowerUserId":"226024","duration":3,"payType":"到期还本付息","durationUnit":"个月","isAllowDebt":0,"remainAmount":0,"launchTime":1536564600000,"systemTime":1562032203053,"name":"XYB-18IJ001","type":8,"id":"151664","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"170,000","income":9},{"bespokeType":0,"floatingIncome":0,"status":70,"borrowerUserId":"226038","duration":3,"payType":"到期还本付息","durationUnit":"个月","isAllowDebt":0,"remainAmount":0,"launchTime":1536301800000,"systemTime":1562032203053,"name":"XYB-18IG001","type":8,"id":"151663","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"130,000","income":9},{"bespokeType":0,"floatingIncome":0,"status":70,"borrowerUserId":"226025","duration":3,"payType":"到期还本付息","durationUnit":"个月","isAllowDebt":0,"remainAmount":0,"launchTime":1536222600000,"systemTime":1562032203054,"name":"XYB-18IF002","type":8,"id":"151662","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"120,000","income":9},{"bespokeType":0,"floatingIncome":0,"status":70,"borrowerUserId":"226041","duration":3,"payType":"到期还本付息","durationUnit":"个月","isAllowDebt":0,"remainAmount":0,"launchTime":1536201000000,"systemTime":1562032203055,"name":"XYB-18IF001","type":8,"id":"151661","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"120,000","income":9},{"bespokeType":0,"floatingIncome":0,"status":70,"borrowerUserId":"226046","duration":3,"payType":"到期还本付息","durationUnit":"个月","isAllowDebt":0,"remainAmount":0,"launchTime":1536127200000,"systemTime":1562032203056,"name":"XYB-18IE001","type":8,"id":"151660","progress":100,"hotSale":0,"minMoney":1000,"recommend":0,"totalAmount":"160,000","income":9}],"totalNum":961,"currentPage":1,"totalPage":97,"startIndex":0}}');
    List list = banMap["body"]["items"];
    for (int i = 0; i < list.length; i++) {
      var pro = new product.fromJson(list[i]);
      productList.add(pro);
    }
  }
}
