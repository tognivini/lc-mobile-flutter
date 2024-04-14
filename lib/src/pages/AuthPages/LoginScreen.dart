// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  String id;

  LoginScreen({
    super.key,
    required this.id,
  });

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
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 10),
                child: Center(
                    child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/no-image.png'),
                )),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Email válido plz'),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 20, bottom: 0, left: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Pass válido plz'),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 50,
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
                        print('katchouwn');
                      },
                      child: const Text('Login'),
                    ),
                  )),
              // const size box here
              const SizedBox(
                height: 90,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text('Crie uma conta',
                      style: TextStyle(color: Colors.blue)))
            ],
          ),
        ));
  }
}
