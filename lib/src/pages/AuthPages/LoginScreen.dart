// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  // String id;

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  // LoginScreen({
  //   super.key,
  //   required this.id,
  // });

  TextEditingController nomeController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController imagemController = TextEditingController();

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
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Text('Login',
                    style: TextStyle(color: Colors.black, fontSize: 26)),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Email válido plz'),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 20, bottom: 0, left: 20),
                  child: TextFormField(
                    obscureText: true,
                    controller: senhaController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Pass válido plz'),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
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
                        print(nomeController.text);
                        print(matriculaController.text);
                        print(emailController.text);
                        print(senhaController.text);
                      },
                      child: const Text('Login'),
                    ),
                  )),
              const SizedBox(
                height: 220,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/register/1',
                    );
                  },
                  child: const Text('Crie uma conta',
                      style: TextStyle(color: Colors.blue))),
            ],
          ),
        ));
  }
}
