import 'package:flutter/material.dart';
import 'package:lc_mobile_flutter/src/pages/AuthPages/RegisterScreen.dart';
import 'package:lc_mobile_flutter/src/pages/CommonPages/NextSchedulesScreen.dart';
import 'package:lc_mobile_flutter/src/pages/CommonPages/Profile/EditProfile.dart';
import 'navigator_keys.dart';

import '../pages/CommonPages/Tab/NaviBottom.dart';
import '../pages/AuthPages/LoginScreen.dart';
import '../pages/CommonPages/Profile/ProfileScreen.dart';
import '../pages/CommonPages/ScheduleScreen.dart';
import '../../shared/tab_item_widget.dart';

get tabs => [
      TabItemWidget(
        routes: {
          '/': (BuildContext context) => const ProfileScreen(),
          // '/edit': (BuildContext context) => const EditProfileScreen(),
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
      '/edit': (context) {
        final args = ModalRoute.of(context)!.settings.arguments;
        if (args is Map<String, String>) {
          final name = args['name'];
          return EditProfileScreen(name: name);
        }

        return const EditProfileScreen();
      },
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
