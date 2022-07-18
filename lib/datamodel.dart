// To parse this JSON data, do
//
// final dataModel = dataModelFromJSON(json String);


import 'dart:convert';
DataModel dataModelFromJson(String str) =>DataModel.fromJson(json.decode(str));
String DataModelToJson(DataModel data) =>json.encode(data.toJson());
class DataModel {
  DataModel({
    required this.name,
    required this.job,
    required this.id,
    required this.creditAt,
  });
String name;
String job;
String id;
String creditAt;
factory DataModel.FromJson(Map<String, dynamic> json)=> DataModel(
  name: json["name"],
  job: json["job"],
  id:  json["id"],
  creditAt: json["creditAt"],
);
Map<String,dynamic>toJson() => {
  "name": name,
  "job": job,
  "id": id,
  "creditAt":creditAt,
};

  static fromJson(decode) {}
}