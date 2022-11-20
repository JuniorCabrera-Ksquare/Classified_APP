import 'package:classified_app/navigation/const_routes.dart';
import 'package:classified_app/screens/create_ad.dart';
import 'package:classified_app/screens/edit_ad.dart';
import 'package:classified_app/screens/edit_profile.dart';
import 'package:classified_app/screens/home.dart';
import 'package:classified_app/screens/image_viewer.dart';
import 'package:classified_app/screens/login.dart';
import 'package:classified_app/screens/my_ads.dart';
import 'package:classified_app/screens/product_detail.dart';
import 'package:classified_app/screens/register.dart';
import 'package:classified_app/screens/settings.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerPage:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case settingsPage:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case editProfilePage:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      case myAdsPage:
        return MaterialPageRoute(builder: (_) => const MyAdsScreen());
      case editAdPage:
        return MaterialPageRoute(builder: (_) => EditAdScreen(data: args));
      case productDetailPage:
        return MaterialPageRoute(
            builder: (_) => ProductDetailScreen(data: args));
      case createAdPage:
        return MaterialPageRoute(builder: (_) => CreateAdScreen());
      case imageViewerPage:
        return MaterialPageRoute(builder: (_) => ImageViewerScreen(data: args));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: const Text("ERROR"),
                    centerTitle: true,
                  ),
                  body: const Center(
                    child: Text('Page not found!'),
                  ),
                ));
    }
  }
}
