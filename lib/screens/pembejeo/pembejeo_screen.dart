import 'package:flutter/material.dart';
import 'package:shop_app/screens/chat/components/chat_list_item.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class PembejeoScreen extends StatelessWidget {
  static String routeName = "/pembejeo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembejeo'),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Expanded(
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 1.02,
                          child: Container(
                            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                            decoration: BoxDecoration(
                              color: kSecondaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image(
                              image: AssetImage('assets/images/product.png'),
                            ),
                            //  Hero(
                            //   tag: mazao.id.toString() + ,
                            //   child: ,
                            // ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("PEMBEJEO JINA", style: TextStyle(color: Colors.black, fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\Tsh. 20,000",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor,
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                height: getProportionateScreenWidth(28),
                                width: getProportionateScreenWidth(28),
                                decoration: BoxDecoration(
                                  color: kSecondaryColor.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/Call.svg",
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.message,
      ),
    );
  }
}
