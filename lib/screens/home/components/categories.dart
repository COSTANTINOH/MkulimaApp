import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/category.dart';
import 'package:http/http.dart' as http;

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  Future<dynamic> getCategory() async {
    String myApi = "https://mkulima90.000webhostapp.com/admin/api/getcategory.php";
    final response = await http.post(myApi, headers: {'Accept': 'application/json'});

    var category = <Category>[];
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
        Category video = Category.fromJson(element);
        category.add(video);
      },
    );
    return category;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];

    return Center(
      child: Container(
        height: getProportionateScreenWidth(150),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: FutureBuilder(
            future: getCategory(),
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
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
                      child: CategoryCard(
                        icon: "hell",
                        text: snapshot.data[index].categoryName,
                        press: () {},
                      ),
                    );
                  },
                );
              } else {
                return Text("new videos");
              }
            },
          ),
          //  List.generate(
          //   categories.length,
          //   (index) => CategoryCard(
          //     icon: categories[index]["icon"],
          //     text: categories[index]["text"],
          //     press: () {},
          //   ),
          // ),
          // ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(150),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                height: getProportionateScreenWidth(60),
                width: getProportionateScreenWidth(300),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset("assets/icons/Discover.svg"),
              ),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
