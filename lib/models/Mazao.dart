// To parse this JSON data, do
//
//     final mazao = mazaoFromJson(jsonString);

import 'dart:convert';

Mazao mazaoFromJson(String str) => Mazao.fromJson(json.decode(str));

String mazaoToJson(Mazao data) => json.encode(data.toJson());

class Mazao {
  Mazao({
    this.id,
    this.category,
    this.name,
    this.phone,
    this.email,
    this.quantity,
    this.price,
    this.city,
    this.status,
    this.farmerId,
  });

  String id;
  String category;
  String name;
  String phone;
  String email;
  String quantity;
  String price;
  String city;
  String status;
  String farmerId;

  factory Mazao.fromJson(Map<String, dynamic> json) => Mazao(
        id: json["id"],
        category: json["category"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        quantity: json["quantity"],
        price: json["price"],
        city: json["city"],
        status: json["status"],
        farmerId: json["farmer_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "name": name,
        "phone": phone,
        "email": email,
        "quantity": quantity,
        "price": price,
        "city": city,
        "status": status,
        "farmer_id": farmerId,
      };
}
