import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/screens/myshop/tabs/alreadysold_tab.dart';
import 'package:shop_app/screens/myshop/tabs/onmarket_tab.dart';

class MyShopScreen extends StatefulWidget {
  static String routeName = "/myshop";

  const MyShopScreen({Key key}) : super(key: key);

  @override
  _MyShopScreenState createState() => _MyShopScreenState();
}

class _MyShopScreenState extends State<MyShopScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.black87,
            tabs: [
              Tab(text: "Yaliyopo Sokoni"),
              Tab(text: "Yaliyokwisha Uzwa"),
            ],
          ),
          title: Text('Sokoni Langu'),
        ),
        body: TabBarView(
          children: [
            OnMarket(),
            AlreadySold(),
          ],
        ),
      ),
    );
  }
}
