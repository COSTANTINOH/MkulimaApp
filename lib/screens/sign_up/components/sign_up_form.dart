import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String conformpassword;
  bool remember = false;
  final List<String> errors = [];

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

  bool isregistered = false;

  TextEditingController xfname = TextEditingController();

  TextEditingController xphone = TextEditingController();

  TextEditingController xpassword = TextEditingController();

  TextEditingController xlocation = TextEditingController();

  Future<dynamic> register(String fname, String phone, String password, String location) async {
    String myApi = "https://mkulima90.000webhostapp.com/admin/api/register.php/";
    setState(() {
      isregistered = true;
    });

    if (fname == "" || phone == "" || password == "" || location == "") {
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

    final response = await http.post(myApi, headers: {
      'Accept': 'application/json'
    }, body: {
      "fname": "$fname",
      "phone": "$phone",
      "password": "$password",
      "location": "$location",
    });
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null && jsonResponse != 404 && jsonResponse != 500) {
        // var json = jsonDecode(response.body);
        setState(() {
          isregistered = false;
        });
        xfname.clear();
        xpassword.clear();
        xfname.clear();
        xlocation.clear();
        Navigator.pushNamed(
          context,
          LoginSuccessScreen.routeName,
        );
        return Fluttertoast.showToast(
            msg: "Akaunti yako imefanikiwa kutengenezwa",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      } else if (jsonResponse == 404) {
        setState(() {
          isregistered = false;
        });
        return Fluttertoast.showToast(
            msg: "Namba ya simu ishatumika",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
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
            textColor: Colors.white);
      }
    } else {
      return Fluttertoast.showToast(
          msg: "Server Error Please Try Again Later",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white);
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
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: isregistered ? "Inatuma Maombi" : "Jisajili",
            press: () async {
              await register(xfname.text, xphone.text, xpassword.text, xlocation.text);
              // if (_formKey.currentState.validate()) {
              //   _formKey.currentState.save();
              //   // if all are valid then go to success screen
              //   Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              // }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: false,
      controller: xlocation,
      decoration: InputDecoration(
        labelText: "Eneo Unalotokea",
        hintText: "Ingiza jina la eneo unalotokea",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: xpassword,
      decoration: InputDecoration(
        labelText: "Neno la siri",
        hintText: "Ingiza neno la siri",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: xfname,
      decoration: InputDecoration(
        labelText: "Jina Kamili",
        hintText: "Ingiza jina kamili",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: xphone,
      decoration: InputDecoration(
        labelText: "Namba ya simu",
        hintText: "Ingiza namba ya simu",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Call.svg"),
      ),
    );
  }
}
