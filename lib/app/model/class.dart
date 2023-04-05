// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Class classFromJson(String str) => Class.fromJson(json.decode(str));

String classToJson(Class data) => json.encode(data.toJson());

class Class {
  Class({
    this.classId,
    this.teacher,
    this.title,
    this.classTime,
    this.uuid,
    this.className,
    this.email,
  });

  String? classId;
  String? teacher;
  String? title;
  DateTime? classTime;
  String? uuid;
  String? className;
  String? email;


  factory Class.fromJson(Map<String, dynamic> json) => Class(
        classId: json["classId"] == null ? null : json["classId"],
        teacher: json["teacher"] == null ? null : json["teacher"],
        title: json["title"] == null ? null : json["title"],
        classTime: json["classTime"] == null
            ? null
            : DateTime.parse(json["classTime"]),
        uuid: json["uuid"] == null ? null : json["uuid"],
        className: json["className"] == null ? null : json["className"],
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "classId": classId == null ? null : classId,
        "teacher": teacher == null ? null : teacher,
        "title": title == null ? null : title,
        "classTime":
            classTime == null ? null : classTime?.toIso8601String(),
        "uuid": uuid == null ? null : uuid,
        "className": className == null ? null : className,
        "email": email == null ? null : email,
      };
}
