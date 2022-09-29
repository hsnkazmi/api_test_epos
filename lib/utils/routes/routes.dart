import 'package:apitestapp/view/settings/view_AddProduct.dart';
import 'package:apitestapp/view/settings/view_ProductGroup.dart';
import 'package:apitestapp/view/settings/view_ProductUnit.dart';
import 'package:apitestapp/view/settings/view_area.dart';
import 'package:flutter/material.dart';
import 'package:apitestapp/utils/routes/routes_name.dart';
import 'package:apitestapp/view/home_screen.dart';
import 'package:apitestapp/view/login_view.dart';
import 'package:apitestapp/view/signp_view.dart';
import 'package:apitestapp/view/splash_view.dart';

import '../../view/settings/view_AddCompany.dart';
import '../../view/settings/view_AddExpenseType.dart';
import '../../view/settings/view_AddSaleMen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());

      //? forms start here
      //! Setting Forms
      case RoutesName.AddCompany:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AddCompany());
      case RoutesName.AddExpenseType:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AddExpenseType());
      case RoutesName.AddProduct:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AddProduct());

      case RoutesName.AddSaleMen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AddSaleMen());

      case RoutesName.ProductGroup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProductGroup());

      case RoutesName.ProductUnit:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProductUnit());

      case RoutesName.addarea:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ViewAddArea());

      //     case RoutesName.settings:
      // return MaterialPageRoute(
      //     builder: (BuildContext context) => const SignUpView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
