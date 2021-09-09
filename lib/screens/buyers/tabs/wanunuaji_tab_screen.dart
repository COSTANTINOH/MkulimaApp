import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Mazao.dart';
import 'package:shop_app/models/Mnunuaji.dart';
import 'package:shop_app/models/mkulima.dart';
import 'package:shop_app/screens/buyers/widgets/mkulima_card.dart';
import 'package:shop_app/screens/buyers/widgets/mnunuaji_card.dart';
import '../../../size_config.dart';

import 'package:http/http.dart' as http;

class WanunuajiTabScreen extends StatelessWidget {
  Future<dynamic> getFarmerApi() async {
    String myApi = "https://mkulima90.000webhostapp.com/admin/api/getbuyer.php/";
    final response = await http.post(
      myApi,
      headers: {'Accept': 'application/json'},
    );

    var buyers = <Mnunuaji>[];
    var wanunuaji;

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse != null && jsonResponse != 404) {
        var json = jsonDecode(response.body);
        wanunuaji = json;
      }
    }

    wanunuaji.forEach(
      (element) {
        Mnunuaji mkulima = Mnunuaji.fromJson(element);
        buyers.add(mkulima);
      },
    );
    return buyers;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFarmerApi(),
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
            itemCount: snapshot.data.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
                // child: ProductCard(mazao: snapshot.data[index]),
                child: MnunuajiCard(
                  mnunuaji: snapshot.data[index],
                ),
              );
            },
          );
        } else {
          return Center(
            child: Text(
              "hatujafanikiwa kuwavuta wakulima",
            ),
          );
        }
      },
    );
  }
}
