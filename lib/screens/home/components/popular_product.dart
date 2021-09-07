import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import '../../widget/metrics.dart';
import '../../../size_config.dart';
import 'section_title.dart';
import 'seemore/see_more_popular.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: "Popular Products",
              press: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllPopular()),
                );
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          physics: physics,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProductsPopular.length,
                (index) {
                  if (demoProducts[index].isPopular)
                    return ProductCard(product: demoProductsPopular[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
