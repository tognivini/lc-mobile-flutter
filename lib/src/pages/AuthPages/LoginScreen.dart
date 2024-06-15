// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, String? name});
  // String id;

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  TextEditingController matriculaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text('Login',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 20, bottom: 5, left: 20),
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  controller: emailController,
                  // initialValue: 'sathyabaman@gmail.com',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email válido plz',
                    contentPadding:
                        const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 20, bottom: 5, left: 20),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passController,
                  // initialValue: 'sathyabaman@gmail.com',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Pass válido plz',
                    contentPadding:
                        const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        // print(nomeController.text);
                        Navigator.pushNamed(
                          context,
                          '/',
                        );
                      },
                      child: const Text('Login'),
                    ),
                  )),
              const SizedBox(
                height: 100,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/auth/register',
                    );
                  },
                  child: const Text('Crie uma conta',
                      style: TextStyle(color: Colors.blue))),
            ],
          ),
        ));
  }
}
