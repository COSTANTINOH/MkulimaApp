// To parse this JSON data, do
//
//     final mnunuaji = mnunuajiFromJson(jsonString);

import 'dart:convert';

Mnunuaji mnunuajiFromJson(String str) => Mnunuaji.fromJson(json.decode(str));

String mnunuajiToJson(Mnunuaji data) => json.encode(data.toJson());

class Mnunuaji {
    Mnunuaji({
        this.id,
        this.fname,
        this.location,
        this.phone,
        this.password,
    });

    String id;
    String fname;
    String location;
    String phone;
    String password;

    factory Mnunuaji.fromJson(Map<String, dynamic> json) => Mnunuaji(
        id: json["id"],
        fname: json["fname"],
        location: json["location"],
        phone: json["phone"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "location": location,
        "phone": phone,
        "password": password,
    };
}
