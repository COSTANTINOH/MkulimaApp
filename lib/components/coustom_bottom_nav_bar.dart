import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/no_auth.dart';
import 'package:shop_app/screens/chat/chat_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                color: MenuState.home == selectedMenu ? kPrimaryColor : inActiveIconColor,
              ),
              onPressed: () => {
                Navigator.pushNamed(
                  context,
                  HomeScreen.routeName,
                )
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/User Icon.svg",
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Chat bubble Icon.svg",
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final key = 'login';
                final value = prefs.get(key) ?? 0;

                if (value == 0) {
                  Navigator.pushNamed(
                    context,
                    NoAuthBanner.routeName,
                  );
                } else {
                  Navigator.pushNamed(
                    context,
                    ChatScreen.routeName,
                  );
                }
              },
            ),
            IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu ? kPrimaryColor : inActiveIconColor,
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  final key = 'login';
                  final value = prefs.get(key) ?? 0;
                  if (value == 0) {
                    Navigator.pushNamed(
                      context,
                      NoAuthBanner.routeName,
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      ProfileScreen.routeName,
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
