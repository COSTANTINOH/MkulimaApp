import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/sign_up/sign_up_screen.dart';
import 'package:shop_app/screens/widget/metrics.dart';

class NoAuthBanner extends StatelessWidget {
  static String routeName = "/noauth";

  const NoAuthBanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              manualSpacer(step: 30),
              SizedBox(
                  height: deviceHeight(context) * 0.4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: Image.asset('assets/images/lock.png'),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    "Umezuiliwa",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Tafadhali Ingia kwa akaunti yako kuendelea",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    DefaultButton(
                      text: "Ingia",
                      press: () {
                        Navigator.pushNamed(
                          context,
                          SignInScreen.routeName,
                        );
                      },
                    ),
                    manualStepper(step: 5),
                    DefaultButton(
                      text: "Jisajili",
                      press: () {
                        Navigator.pushNamed(
                          context,
                          SignUpScreen.routeName,
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
    );
  }
}
