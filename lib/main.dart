import 'package:flutter/material.dart';
import './src/pages/CommonPages/HomeScreen.dart';
import './src/pages/AuthPages/LoginScreen.dart';
import './src/pages/AuthPages/RegisterScreen.dart';

void main() {
  runApp(const Nav2App());
}

class Nav2App extends StatelessWidget {
  const Nav2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        // Handle '/'
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const HomeScreen());
        }

        var uri = Uri.parse(settings.name.toString());
        if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'login') {
          var id = uri.pathSegments[1];
          // return MaterialPageRoute(builder: (context) => LoginScreen(id: id));
          return MaterialPageRoute(builder: (context) => const LoginScreen());
        } else if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'register') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(
              builder: (context) => const RegisterScreen());
        }

        return MaterialPageRoute(builder: (context) => const UnknownScreen());
      },
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
