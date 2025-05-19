import 'dart:convert';

HomeModel homeModelFromJson(String str) {
  final jsonData = json.decode(str);
  return HomeModel.fromJson(jsonData);
}

class HomeModel {
  Data? data;

  HomeModel({this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );
}

class Data {
  List<Latest>? popular;
  List<Latest>? latest;

  Data({this.popular, this.latest});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    popular:
        json["popular"] == null
            ? null
            : List<Latest>.from(json["popular"].map((x) => Latest.fromJson(x))),
    latest:
        json["latest"] == null
            ? null
            : List<Latest>.from(json["latest"].map((x) => Latest.fromJson(x))),
  );
}

class Latest {
  String? name;
  String? image;
  String? description;

  Latest({this.name, this.image, this.description});

  factory Latest.fromJson(Map<String, dynamic> json) => Latest(
    name: json["name"],
    image: json["image"],
    description: json["description"],
  );
}
