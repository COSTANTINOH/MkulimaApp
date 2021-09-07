import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/services/shared/splash_shared.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/theme.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool splash = false;

  // _saveFirstTime() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'ftime';
  //   final value = "true";
  //   prefs.setString(key, value);

  //   final pref = await SharedPreferences.getInstance();
  //   final keys = 'ftime';
  //   final values = pref.get(keys) ?? 0;

  //   if (values == 0) {
  //     setState(() {
  //       splash = true;
  //     });
  //   } else {
  //     setState(() {
  //       splash = false;
  //     });
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => HomeScreen(),
  //       ),
  //     );
  //   }
  // }

  @override
  void initState() {
    // _saveFirstTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mkulima',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: splash ? SignInScreen.routeName : SplashScreen.routeName,
      // initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
