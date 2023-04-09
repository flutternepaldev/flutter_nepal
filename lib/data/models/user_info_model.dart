// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) =>
    UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  UserInfoModel({
    this.responseData,
    this.status,
    this.message,
  });

  ResponseData? responseData;
  String? status;
  String? message;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        responseData: ResponseData.fromJson(json["responseData"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "responseData": responseData!.toJson(),
        "status": status,
        "message": message,
      };
}

class ResponseData {
  ResponseData({
    this.the1,
  });

  Map<String, String>? the1;

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        the1: Map.from(json["1"])
            .map((k, v) => MapEntry<String, String>(k, v ?? "")),
      );

  Map<String, dynamic> toJson() => {
        "1": Map.from(the1!)
            .map((k, v) => MapEntry<String, dynamic>(k, v ?? "")),
      };
}
