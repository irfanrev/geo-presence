// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.name,
        this.nis,
        this.email,
        this.uid,
        this.userClass,
        this.isTeacher,
        this.gender,
    });

    String? name;
    String? nis;
    String? email;
    String? uid;
    String? userClass;
    bool? isTeacher;
    String? gender;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        nis: json["nis"],
        email: json["email"],
        uid: json["uid"],
        userClass: json["class"],
        isTeacher: json["isTeacher"],
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "nis": nis,
        "email": email,
        "uid": uid,
        "class": userClass,
        "isTeacher": isTeacher,
        "gender": gender,
    };
}
