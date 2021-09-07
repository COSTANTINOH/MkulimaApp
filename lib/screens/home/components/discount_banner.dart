import 'package:flutter/material.dart';
import '../../widget/metrics.dart';
import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: physics,
      child: Row(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(250),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: Card(
                color: Color(0xFF4A3298),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 10,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Pamba Kazi',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: deviceHeight(context) / 30,
                              fontWeight: FontWeight.bold),
                        ),
                        manualStepper(step: deviceWidth(context) ~/ 50),
                        Text(
                          'Fuoni Zanzibar',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(250),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: Card(
                color: Color(0xFF4A3298),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 10,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Pamba Kazi',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: deviceHeight(context) / 30,
                              fontWeight: FontWeight.bold),
                        ),
                        manualStepper(step: deviceWidth(context) ~/ 50),
                        Text(
                          'Fuoni Zanzibar',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
              ),
            ),
          )
          // Container(
          //   // height: 90,
          //   width: getProportionateScreenWidth(250),
          //   margin: EdgeInsets.all(getProportionateScreenWidth(20)),
          //   padding: EdgeInsets.symmetric(
          //     horizontal: getProportionateScreenWidth(20),
          //     vertical: getProportionateScreenWidth(15),
          //   ),
          //   decoration: BoxDecoration(
          //     color: Color(0xFF4A3298),
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: Text.rich(
          //     TextSpan(
          //       style: TextStyle(color: Colors.white),
          //       children: [
          //         TextSpan(text: "Pamba Kali Stores\n"),
          //         TextSpan(
          //           text: "Fuoni",
          //           style: TextStyle(
          //             fontSize: getProportionateScreenWidth(24),
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
