import 'package:flutter/material.dart';
import 'package:shop_app/models/Mazao.dart';

class ProductCard extends StatelessWidget {
  final Mazao product;
  const ProductCard({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text(
                    "Jina La Zao : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "${product.name}",
                  ),
                ],
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text(
                    "Idadi : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "${product.quantity}",
                  ),
                ],
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text(
                    "Idadi : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "${product.quantity}",
                  ),
                ],
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text(
                    "Namba ya simu : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "${product.phone}",
                  ),
                ],
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text(
                    "Barua Pepe : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "${product.email}",
                  ),
                ],
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text(
                    "Bei : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "${product.price}",
                  ),
                ],
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text(
                    "Mahali : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "${product.city}",
                  ),
                ],
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text(
                    "Hali : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    "${product.status}",
                  ),
                ],
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  FlatButton(
                    color: Colors.greenAccent,
                    splashColor: Colors.white,
                    onPressed: () {},
                    child: Text("Nimeshauza"),
                  ),
                  SizedBox(width: 3),
                  FlatButton(
                    color: Colors.red,
                    splashColor: Colors.white,
                    onPressed: () {},
                    child: Text("Ondoa Sokoni"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
