import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/buyers/tab_screen.dart';
import 'package:shop_app/screens/buyers/tabs/wakulima_tab_screen.dart';
import 'package:shop_app/screens/buyers/tabs/wanunuaji_tab_screen.dart';
import 'package:shop_app/screens/chat/chat_list_screen.dart';
import 'package:shop_app/screens/chat/new_chat_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

class BuyerScreen extends StatefulWidget {
  const BuyerScreen({Key key}) : super(key: key);

  static String routeName = "/buyerfamer";

  @override
  _BuyerScreenState createState() => _BuyerScreenState();
}

class _BuyerScreenState extends State<BuyerScreen> with TickerProviderStateMixin {
  static const List<IconData> icons = const [Icons.sms, Icons.phone];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.black87,
            tabs: [
              Tab(text: "Mazungumzo"),
              Tab(text: "Wakulima"),
              Tab(text: "Wanunuaji"),
            ],
          ),
          title: Text('Mazungumzo'),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.flight, size: 350),
            WakulimaTabScreen(),
            WanunuajiTabScreen(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          selectedMenu: MenuState.favourite,
        ),
      ),
    );
  }
}
