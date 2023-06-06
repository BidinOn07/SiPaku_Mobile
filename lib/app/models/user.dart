import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.idUser,
    this.name,
    this.username,
    this.jk,
    this.alamat,
    this.level,
    this.idPosyandu,
    this.createdAt,
    this.updatedAt,
  });

  int? idUser;
  String? name;
  String? username;
  String? jk;
  String? alamat;
  String? level;
  int? idPosyandu;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json["id_user"],
        name: json["name"],
        username: json["username"],
        jk: json["jk"],
        alamat: json["alamat"],
        level: json["level"],
        idPosyandu: json["id_posyandu"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "name": name,
        "username": username,
        "jk": jk,
        "alamat": alamat,
        "level": level,
        "id_posyandu": idPosyandu,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
