import 'package:flutter/material.dart';

class TabItemWidget extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Map<String, WidgetBuilder> routes;

  const TabItemWidget({
    super.key,
    required this.navigatorKey,
    required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      routes: routes,
      initialRoute: '/',
    );
  }
}
