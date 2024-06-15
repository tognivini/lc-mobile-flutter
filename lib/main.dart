import 'package:flutter/material.dart';
import 'package:lc_mobile_flutter/routes.dart';
import 'package:lc_mobile_flutter/src/pages/AuthPages/LoginScreen.dart';
import 'package:lc_mobile_flutter/src/pages/AuthPages/RegisterScreen.dart';
import 'package:lc_mobile_flutter/src/pages/CommonPages/Home/Home.dart';
import 'package:lc_mobile_flutter/src/pages/CommonPages/ProfileScreen.dart';

import 'navigator_keys.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigatorKeys.navigatorKeyMain,
      routes: routes,
      title: _title,
      initialRoute: '/',
      // onGenerateRoute: (settings) {
      //   print(settings);
      //   var uri = Uri.parse(settings.name.toString());
      //   print('>>>>>>>> uri e settings');
      //   print(uri);
      //   if (settings.name == '/') {
      //     return MaterialPageRoute(builder: (context) => const HomePage());
      //   } else if (uri.pathSegments.first == 'auth') {
      //     return MaterialPageRoute(
      //         builder: (context) => const ProfileScreen());
      //   } else {
      //     if (uri.pathSegments.first == 'login') {
      //       return MaterialPageRoute(
      //           builder: (context) => const LoginScreen());
      //     } else if (uri.pathSegments.first == 'register') {
      //       return MaterialPageRoute(
      //           builder: (context) => const RegisterScreen());
      //     }
      //   }
      //   return MaterialPageRoute(builder: (context) => const UnknownScreen());
      // }
    );
  }
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('404!'),
      ),
    );
  }
}
