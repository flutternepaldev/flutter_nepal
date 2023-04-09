// To parse this JSON data, do
//
//     final validationModel = validationModelFromJson(jsonString);

import 'dart:convert';

ValidationModel validationModelFromJson(String str) =>
    ValidationModel.fromJson(json.decode(str));

String validationModelToJson(ValidationModel data) =>
    json.encode(data.toJson());

class ValidationModel {
  ValidationModel({
    this.emailAddress,
    this.phoneNumber,
  });

  List<String>? emailAddress;
  List<String>? phoneNumber;

  factory ValidationModel.fromJson(Map<String, dynamic> json) =>
      ValidationModel(
        emailAddress: List<String>.from(json["email_address"].map((x) => x)),
        phoneNumber: List<String>.from(json["phone_number"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email_address": List<dynamic>.from(emailAddress!.map((x) => x)),
        "phone_number": List<dynamic>.from(phoneNumber!.map((x) => x)),
      };
}
