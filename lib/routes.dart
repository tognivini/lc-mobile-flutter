import 'package:flutter/material.dart';
import 'package:lc_mobile_flutter/src/pages/AuthPages/RegisterScreen.dart';
import 'package:lc_mobile_flutter/src/pages/CommonPages/NextSchedulesScreen.dart';
import 'navigator_keys.dart';

import 'src/pages/CommonPages/Tab/NaviBottom.dart';
import './src/pages/AuthPages/LoginScreen.dart';
import './src/pages/CommonPages/ProfileScreen.dart';
import './src/pages/CommonPages/ScheduleScreen.dart';
import 'shared/tab_item_widget.dart';

get tabs => [
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => const ProfileScreen(),
        },
        navigatorKey: NavigatorKeys.navigatorKeyProfile,
      ),
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => const ScheduleScreen(),
          // '/page2/sub': (BuildContext context) => const RegisterScreen(),
        },
        navigatorKey: NavigatorKeys.navigatorKeyBusiness,
      ),
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => const NextSchedulesScreen(),
        },
        navigatorKey: NavigatorKeys.navigatorKeySchedule,
      ),
    ];

Map<String, WidgetBuilder> get routes => {
      '/': (context) => NaviBottom(),
      '/auth/login': (context) {
        final args = ModalRoute.of(context)!.settings.arguments;
        if (args is Map<String, String>) {
          final name = args['name'];
          return LoginScreen(name: name);
        }

        return const LoginScreen();
      },
      '/auth/register': (context) {
        final args = ModalRoute.of(context)!.settings.arguments;
        if (args is Map<String, String>) {
          final name = args['name'];
          return RegisterScreen(name: name);
        }

        return const RegisterScreen();
      }
    };
