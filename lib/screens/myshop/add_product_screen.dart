import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/screens/myshop/myshop_screen.dart';
import 'package:shop_app/screens/myshop/tabs/onmarket_tab.dart';

class AddProductScreen extends StatefulWidget {
  static String routeName = "/addproduct";

  const AddProductScreen({Key key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController jinazao = new TextEditingController();
  TextEditingController nambasimu = new TextEditingController();
  TextEditingController baruapepe = new TextEditingController();
  TextEditingController idadi = new TextEditingController();
  TextEditingController gharama = new TextEditingController();
  TextEditingController mahali = new TextEditingController();
  TextEditingController maelezo = new TextEditingController();
  bool isregistered = false;

  Future<dynamic> registerProduct(
      String jinazao, String nambasimu, String baruapepe, String idadi, String gharama, String mahali, String maelezo) async {
    String myApi = "https://mkulima90.000webhostapp.com/admin/api/addproduct.php/";
    setState(() {
      isregistered = true;
    });

    final prefs = await SharedPreferences.getInstance();
    final key = 'userId';
    final hostId = prefs.get(key) ?? 0;

    final response = await http.post(myApi, headers: {
      'Accept': 'application/json'
    }, body: {
      "jinazao": "$jinazao",
      "nambasimu": "$nambasimu",
      "baruapepe": "$baruapepe",
      "idadi": "$idadi",
      "gharama": "$gharama",
      "mahali": "$mahali",
      "maelezo": "$maelezo",
      "userId": "$hostId",
    });
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null && jsonResponse != 404 && jsonResponse != 500) {
        // var json = jsonDecode(response.body);
        setState(() {
          isregistered = false;
        });
        Navigator.pushNamed(
          context,
          MyShopScreen.routeName,
        );
        return Fluttertoast.showToast(
            msg: "Zao limeongezwa sokoni kikamirifu",
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
            msg: "Kuna tatizo",
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Ongeza Zao'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Jina la zao',
                        ),
                        controller: jinazao,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Namba ya simu',
                        ),
                        controller: nambasimu,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Barua pepe',
                        ),
                        controller: baruapepe,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Idadi ya mazao(KG)',
                        ),
                        controller: idadi,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Gharama',
                        ),
                        controller: gharama,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Mahali',
                        ),
                        controller: mahali,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        minLines: 1,
                        maxLines: 20,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Maelezo ya zao',
                        ),
                        controller: maelezo,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      FlatButton(
                        color: Colors.blue,
                        splashColor: Colors.white,
                        textColor: Colors.white,
                        onPressed: () {
                          if (jinazao.text.isEmpty ||
                              nambasimu.text.isEmpty ||
                              baruapepe.text.isEmpty ||
                              idadi.text.isEmpty ||
                              gharama.text.isEmpty ||
                              mahali.text.isEmpty ||
                              maelezo.text.isEmpty) {
                            return Fluttertoast.showToast(
                              msg: "Tafadhari weka taarifa zote",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                            );
                          } else {
                            registerProduct(
                              jinazao.text,
                              nambasimu.text,
                              baruapepe.text,
                              idadi.text,
                              gharama.text,
                              mahali.text,
                              maelezo.text,
                            ).whenComplete(() {
                              jinazao.clear();
                              nambasimu.clear();
                              baruapepe.clear();
                              idadi.clear();
                              gharama.clear();
                              mahali.clear();
                              maelezo.clear();
                            });
                          }
                        },
                        child: Text(
                          "Tuma sokoni",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
