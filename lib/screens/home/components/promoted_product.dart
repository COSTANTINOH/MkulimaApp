import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Mazao.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;

import 'section_title.dart';

class PromotedProducts extends StatelessWidget {
  Future<dynamic> getProductCategory() async {
    String myApi = "https://mkulima90.000webhostapp.com/admin/api/getproduct.php";
    final response = await http.post(myApi, headers: {'Accept': 'application/json'});

    var category = <Mazao>[];
    var categories;

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse != null && jsonResponse != 404) {
        var json = jsonDecode(response.body);
        categories = json;
      }
    }

    categories.forEach(
      (element) {
        Mazao video = Mazao.fromJson(element);
        category.add(video);
      },
    );
    return category;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Promoted Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Container(
          height: getProportionateScreenWidth(200),
          width: double.infinity,
          child: FutureBuilder(
            future: getProductCategory(),
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
                // return Text("${snapshot.data}");
                print("lenght ${snapshot.data}");
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    // return Text("${snapshot.data[index].id}");
                    return Padding(
                      padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
                      child: ProductCard(mazao: snapshot.data[index]),
                    );
                  },
                );
              } else {
                return Text("new videos");
              }
            },
          ),
        )
      ],
    );
  }
}
