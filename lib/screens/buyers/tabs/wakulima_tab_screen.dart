import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Mazao.dart';
import 'package:shop_app/models/mkulima.dart';
import 'package:shop_app/screens/buyers/widgets/mkulima_card.dart';
import '../../../size_config.dart';

import 'package:http/http.dart' as http;

class WakulimaTabScreen extends StatelessWidget {
  Future<dynamic> getFarmerApi() async {
    String myApi = "https://mkulima90.000webhostapp.com/admin/api/getfarmer.php/";
    final response = await http.post(
      myApi,
      headers: {'Accept': 'application/json'},
    );

    var farmer = <Mkulima>[];
    var wakulima;

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse != null && jsonResponse != 404) {
        var json = jsonDecode(response.body);
        wakulima = json;
      }
    }

    wakulima.forEach(
      (element) {
        Mkulima mkulima = Mkulima.fromJson(element);
        farmer.add(mkulima);
      },
    );
    return farmer;
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
                child: MkulimaCard(mkulima: snapshot.data[index]),
              );
            },
          );
        } else {
          return Center(
            child: Text("hatujafanikiwa kuwavuta wakulima"),
          );
        }
      },
    );
  }
}
