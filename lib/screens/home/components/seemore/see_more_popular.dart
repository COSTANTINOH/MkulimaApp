import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import '../../../widget/metrics.dart';
import 'package:shop_app/models/Product.dart';
import '../../../../components/all_product.dart';

class AllPopular extends StatelessWidget {
  static String routeName = "/allpopular";

  AllPopular();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(
            child: SvgPicture.asset(
              "assets/icons/Back ICon.svg",
              height: 15,
            ),
            onTap: () => Navigator.pop(context),
          ),
          middle: Text("All Popular Product")),
      child: SafeArea(
        child: GridView.builder(
          physics: physics,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: deviceWidth(context) >= 800 ? 3 : 2,
          ),
          itemCount: demoProductsPopular.length,
          itemBuilder: (_, int i) {
            return AnimationConfiguration.staggeredGrid(
              position: i,
              columnCount: 2,
              duration: Duration(seconds: 2),
              child: SlideAnimation(
                verticalOffset: -100,
                horizontalOffset: -100,
                duration: Duration(milliseconds: 600),
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    // child: AllProductCard(product: demoProductsPopular[i]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
