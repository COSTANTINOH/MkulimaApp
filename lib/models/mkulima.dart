// To parse this JSON data, do
//
//     final mkulima = mkulimaFromJson(jsonString);

import 'dart:convert';

Mkulima mkulimaFromJson(String str) => Mkulima.fromJson(json.decode(str));

String mkulimaToJson(Mkulima data) => json.encode(data.toJson());

class Mkulima {
    Mkulima({
        this.id,
        this.name,
        this.location,
        this.descp,
        this.phone,
        this.email,
        this.password,
        this.tag,
    });

    String id;
    String name;
    String location;
    String descp;
    String phone;
    String email;
    String password;
    String tag;

    factory Mkulima.fromJson(Map<String, dynamic> json) => Mkulima(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        descp: json["descp"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        tag: json["tag"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "descp": descp,
        "phone": phone,
        "email": email,
        "password": password,
        "tag": tag,
    };
}
