import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../models/success_model.dart';
import '../../models/user_details_model.dart';
import '../api.dart';
import '../api_constants.dart';

class OthersApi extends ApiClient {
  OthersApi(super.localStorage);

  Future<SuccessModel> storeNewUser(fullName, emailAddress, imagePath,
      profileImage, phoneNumber, experience, heardAbout, companyName) async {
    var formData = FormData.fromMap({
      "full_name": fullName,
      "email_address": emailAddress,
      "phone_number": phoneNumber,
      "profile_image": MultipartFile.fromBytes(
        imagePath,
        filename: profileImage,
      ),
      "company_name": companyName,
      "experienced_years": experience,
      "heard_about_us": heardAbout,
    });
    try {
      var respose =
          await super.postData(apiName: ApiNames.storeUser, body: formData);
      if (respose.statusCode == 200) {
        final responseData = SuccessModel.fromJson(respose.data);
        return responseData;
      } else {
        return SuccessModel();
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Exception:$e");
      }
      return SuccessModel();
    }
  }

  Future<UserDetailsModel> getUserDetails() async {
    try {
      final dio = Dio();
      final respose =
          await dio.get(ApiConstants.baseUrl + ApiNames.meetupUsers);
      if (respose.statusCode == 200) {
        final responseData = UserDetailsModel.fromJson(respose.data);
        return responseData;
      } else {
        return UserDetailsModel();
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Exception:$e");
      }
      return UserDetailsModel();
    }
  }
}
