import 'dart:convert';

NotificationDataModel notificationDataModelFromJson(String str) {
  final jsonData = json.decode(str);
  return NotificationDataModel.fromJson(jsonData);
}

String notificationDataModelToJson(NotificationDataModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class NotificationDataModel {
  NotificationDataModelData? data;

  NotificationDataModel({this.data});

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) =>
      NotificationDataModel(
        data:
            json["data"] == null
                ? null
                : NotificationDataModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"data": data?.toJson()};
}

class NotificationDataModelData {
  Earlier? dataNew;
  Earlier? today;
  Earlier? earlier;

  NotificationDataModelData({this.dataNew, this.today, this.earlier});

  factory NotificationDataModelData.fromJson(Map<String, dynamic> json) =>
      NotificationDataModelData(
        dataNew: json["new"] == null ? null : Earlier.fromJson(json["new"]),
        today: json["today"] == null ? null : Earlier.fromJson(json["today"]),
        earlier:
            json["earlier"] == null ? null : Earlier.fromJson(json["earlier"]),
      );

  Map<String, dynamic> toJson() => {
    "new": dataNew?.toJson(),
    "today": today?.toJson(),
    "earlier": earlier?.toJson(),
  };
}

class Earlier {
  String? categoryName;
  List<DataElement>? datas;

  Earlier({this.categoryName, this.datas});

  factory Earlier.fromJson(Map<String, dynamic> json) => Earlier(
    categoryName: json["categoryName"],
    datas:
        json["datas"] == null
            ? null
            : List<DataElement>.from(
              json["datas"].map((x) => DataElement.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "categoryName": categoryName,
    "datas":
        datas == null
            ? null
            : List<dynamic>.from(datas!.map((x) => x.toJson())),
  };
}

class DataElement {
  String? name;
  String? image;
  String? description;
  String? icon;
  String? time;

  DataElement({this.name, this.image, this.description, this.icon, this.time});

  factory DataElement.fromJson(Map<String, dynamic> json) => DataElement(
    name: json["name"],
    image: json["image"],
    description: json["description"],
    icon: json["icon"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "description": description,
    "icon": icon,
    "time": time,
  };
}
