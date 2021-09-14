import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/Mazao.dart';
import 'package:shop_app/screens/home/components/categories.dart';
import 'package:shop_app/screens/home/components/product_cart.dart';

import '../../../size_config.dart';

class OnMarket extends StatefulWidget {
  const OnMarket({Key key}) : super(key: key);

  @override
  _OnMarketState createState() => _OnMarketState();
}

class _OnMarketState extends State<OnMarket> {
  Future<dynamic> getMyProductSale() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userId';
    final hostId = prefs.get(key) ?? 0;
    print("userId# $hostId");
    String myApi = "https://mkulima90.000webhostapp.com/admin/api/getmyproduct.php/";
    final response = await http.post(
      myApi,
      headers: {
        'Accept': 'application/json',
      },
      body: {
        "userId": "$hostId",
      },
    );

    var zao = <Mazao>[];
    var mazao;

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse != null && jsonResponse != 404) {
        var json = jsonDecode(response.body);
        mazao = json;
      }
    }

    mazao.forEach(
      (element) {
        Mazao video = Mazao.fromJson(element);
        zao.add(video);
      },
    );
    return zao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(5)),
        child: FutureBuilder(
          future: getMyProductSale(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError || !snapshot.hasData) {
              return Center(
                child: Text("No Data"),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                // scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return ProductCard(product: snapshot.data[index]);
                },
              );
            } else {
              return Text("new videos");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
