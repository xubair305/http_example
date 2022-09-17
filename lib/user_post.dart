// To parse this JSON data, do
//
//     final userPost = userPostFromJson(jsonString);

import 'dart:convert';

UserPost userPostFromJson(String str) => UserPost.fromJson(json.decode(str));

String userPostToJson(UserPost data) => json.encode(data.toJson());

class UserPost {
  UserPost({
    this.id,
    this.name,
    this.job,
    this.updatedAt,
    this.createdAt,
  });

  String? id;
  String? name;
  String? job;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory UserPost.fromJson(Map<String, dynamic> json) => UserPost(
        id: json["id"],
        job: json["job"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
      };
}
