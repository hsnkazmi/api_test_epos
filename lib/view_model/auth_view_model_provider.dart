import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:apitestapp/model/user_model.dart';
import 'package:apitestapp/respository/auth_repository.dart';
import 'package:apitestapp/utils/routes/routes_name.dart';
import 'package:apitestapp/utils/utils.dart';
import 'package:apitestapp/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModelProvider with ChangeNotifier {
  final _authRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(JasonUserModel(token: value['token'].toString()));
      Utils.flushBarSuccessMessage('Login Successfully', context);
      // go to home after login succesfull
      // Navigator.pushNamed(context, RoutesName.home);
      Navigator.pushNamed(context, RoutesName.addarea);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);

    _authRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('SignUp Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
