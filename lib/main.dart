import 'package:flutter/material.dart';
import 'package:lc_mobile_flutter/src/routes/routes.dart';

import 'src/routes/navigator_keys.dart';

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
    );
  }
}
