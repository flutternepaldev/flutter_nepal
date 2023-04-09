import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/user_cubit/user_cubit.dart';
import '../data/models/user_info_model.dart';

class Utils {
  static Future<void> manipulateSplashData(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.get("userId");
    var strUser = prefs.get("user");
    if (userId != null) {
      UserInfoModel data = UserInfoModel.fromJson(json.decode("$strUser"));
      saveUserData(data);
      setCurrentUserData(data, context);
    } else {
      clearSavedData();
      // AutoRouter.of(context).popAndPush(const LoginRoute());
    }

    // var token = prefs.getString("token");
    // if (token != null && strUser != null) {
    //   var repository = context.read<Repository>();
    //   var tokenCheck = await repository.authApi.getUserInfo(token: token);
    //   if (tokenCheck.id != 0 && tokenCheck.success != 0) {
    //     UserInfoModel data = UserInfoModel.fromJson(json.decode("$strUser"));
    //     saveUserData(data);
    //     setCurrentUserData(data, context);
    //     // ignore: avoid_print
    //     print("=====>>> id = ${tokenCheck.id}");
    //   } else {
    //     clearSavedData();
    //     AutoRouter.of(context).popAndPush(const Login());
    //   }
    // } else {
    //   AutoRouter.of(context).popAndPush(const Login());
    // }
  }

  static void setCurrentUserData(
      UserInfoModel model, BuildContext context) async {
    context.read<UserCubit>().onUpdateUserData(model);
    // AutoRouter.of(context).popAndPush(const MainScreenRoute());
  }

  static Future<void> saveUserData(UserInfoModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(model.toJson()));
  }

  static Future<void> saveUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  static Future<void> saveUserId(String matriId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userId", matriId);
  }

  static Future<void> saveGender(String gender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("gender", gender);
  }

  static Future<void> saveMembership(String gender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("membership", gender);
  }

  static Future<void> saveLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("language", language);
  }

  // static void changeLanguage(String lang, BuildContext context) {
  //   DioUtils.lang = lang;
  //   WidgetUtils.lang = lang;
  //   context.read<LangCubit>().onUpdateLanguage(lang);
  // }

  static UserInfoModel getSavedUser({required BuildContext context}) {
    return context.read<UserCubit>().state.model;
  }

  static Future<void> clearSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future launchURL({required String url}) async {
    if (!url.toString().startsWith("https")) {
      url = "https://$url";
    }
    await launchUrl(Uri.parse(url));
  }

  // static String getCurrentUserId({required BuildContext context}) {
  //   var provider = context.watch<UserCubit>().state.model;
  //   return provider.id;
  // }
}
