import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/myshop/myshop_screen.dart';
import 'package:shop_app/services/shared/splash_shared.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Sokoni Langu",
            icon: "assets/icons/Bell.svg",
            press: () {
              Navigator.pushNamed(
                context,
                MyShopScreen.routeName,
              );
            },
          ),
          // ProfileMenu(
          //   text: "Settings",
          //   icon: "assets/icons/Settings.svg",
          //   press: () {},
          // ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Toka kwenye akaunti",
            icon: "assets/icons/Log out.svg",
            press: () {
              LocalStorage.removeItem("login");
              LocalStorage.removeItem("id");

              Navigator.pushNamed(
                context,
                HomeScreen.routeName,
              );

              return Fluttertoast.showToast(
                msg: "Umetoka nje ya akaunt yako",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
              );
            },
          ),
        ],
      ),
    );
  }
}
