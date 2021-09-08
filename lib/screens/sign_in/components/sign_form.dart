import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/services/shared/splash_shared.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];
  TextEditingController _phone = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool load = false;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isregistered = false;

  _saveLogin(String token) async {
    final key = 'login';
    final value = token;
    LocalStorage.setStringItem(key, value);
  }

  _saveLoginID(String token) async {
    final key = 'userId';
    final value = token;
    LocalStorage.setStringItem(key, value);
  }

  _saveLoginTagFarmer(String token) async {
    final key = 'tag';
    final value = token;
    LocalStorage.setStringItem(key, value);
  }

  Future<dynamic> login(String phone, String password) async {
    if (phone == "" || password == "") {
      setState(() {
        isregistered = false;
      });

      return Fluttertoast.showToast(
          msg: "Tafadhari weka taarifa zote",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
    String myApi = "https://mkulima90.000webhostapp.com/admin/api/login.php/";
    final response = await http.post(
      myApi,
      headers: {'Accept': 'application/json'},
      body: {
        "phone": "$phone",
        "password": "$password",
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse != null && jsonResponse != 404 && jsonResponse != 500) {
        var json = jsonDecode(response.body);
        setState(
          () {
            isregistered = false;
            phoneController.text = "";
            passwordController.text = "";
          },
        );
        _saveLogin(json[0]['name']);
        _saveLoginID(json[0]['id']);
        if (json[0]["tag"] != null) {
          _saveLoginTagFarmer(json[0]["tag"]);
        }
        Navigator.pushNamed(
          context,
          HomeScreen.routeName,
        );
        return Fluttertoast.showToast(
          msg: "Welcome to your account",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      } else if (jsonResponse == 404) {
        setState(
          () {
            isregistered = false;
          },
        );
        return Fluttertoast.showToast(
          msg: "Phone Number Not Found Please Register",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      } else if (jsonResponse == 500) {
        setState(() {
          isregistered = false;
        });
        return Fluttertoast.showToast(
          msg: "Server Error Please Try Again Later",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } else {
      setState(
        () {
          isregistered = false;
        },
      );
      print("no data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Nikumbuke"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Nimesahau neno la siri?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: isregistered ? "Inatuma maombi" : "Ingia",
            press: () async {
              await login(phoneController.text, passwordController.text);
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
        labelText: "Neno la siri",
        hintText: "Ingiza neno la siri",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: phoneController,
      decoration: InputDecoration(
        labelText: "Namba ya simu",
        hintText: "Ingiza namba ya simu",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Call.svg"),
      ),
    );
  }
}
