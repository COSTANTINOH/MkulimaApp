import 'package:flutter/material.dart';
import 'package:shop_app/screens/widget/metrics.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key key, this.text, this.press, this.icon}) : super(key: key);
  final String text;
  final Function press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: kPrimaryColor,
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            manualSpacer(
              step: 10,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
