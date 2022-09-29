import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:apitestapp/model/user_model.dart';
import 'package:apitestapp/utils/routes/routes_name.dart';
import 'package:apitestapp/view_model/user_view_model.dart';

class SplashServices {
  Future<JasonUserModel> getUserDate() {
    return UserViewModel().getUser();
  }

  void checkAuthentication(BuildContext context) async {
    getUserDate().then((value) async {
      print(value.token.toString());

      if (value.token.toString() == 'null' || value.token.toString() == '') {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        // Navigator.pushNamed(context, RoutesName.home);
        Navigator.pushNamed(context, RoutesName.signUp);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
