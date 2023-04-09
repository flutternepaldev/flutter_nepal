// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) => UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) => json.encode(data.toJson());

class UserDetailsModel {
    UserDetailsModel({
        this.status,
        this.message,
        this.meetupUsers,
    });

    int? status;
    String? message;
    List<MeetupUser>? meetupUsers;

    factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
        status: json["status"],
        message: json["message"],
        meetupUsers: json["meetup_users"] == null ? [] : List<MeetupUser>.from(json["meetup_users"]!.map((x) => MeetupUser.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "meetup_users": meetupUsers == null ? [] : List<dynamic>.from(meetupUsers!.map((x) => x.toJson())),
    };
}

class MeetupUser {
    MeetupUser({
        this.id,
        this.fullName,
        this.emailAddress,
        this.phoneNumber,
        this.profileImage,
        this.companyName,
        this.experiencedYears,
        this.heardAboutUs,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? fullName;
    String? emailAddress;
    String? phoneNumber;
    String? profileImage;
    String? companyName;
    String? experiencedYears;
    String? heardAboutUs;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory MeetupUser.fromJson(Map<String, dynamic> json) => MeetupUser(
        id: json["id"],
        fullName: json["full_name"],
        emailAddress: json["email_address"],
        phoneNumber: json["phone_number"],
        profileImage: json["profile_image"],
        companyName: json["company_name"],
        experiencedYears: json["experienced_years"],
        heardAboutUs: json["heard_about_us"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email_address": emailAddress,
        "phone_number": phoneNumber,
        "profile_image": profileImage,
        "company_name": companyName,
        "experienced_years": experiencedYears,
        "heard_about_us": heardAboutUs,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
