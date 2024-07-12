// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:lc_mobile_flutter/src/service/repositories/AuthRepository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, String? name});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  // TextEditingController matriculaController = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  var _passwordVisible = false;

  onLoadLoginPage() async {
    final db = Localstore.instance;
    db.collection('storageUser').delete();
  }

  @override
  Widget build(BuildContext context) {
    onLoadLoginPage();

    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: const Text('Laundry CEU'),
        // ),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Text('Lavanderia CEU - UFSM',
                    style: TextStyle(color: Colors.black, fontSize: 22)),
              ),
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
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Preencha com seu email',
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
                  obscureText: !_passwordVisible,
                  controller: password,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite uma senha válida por favor',
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
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
                      onPressed: () async {
                        var payload = {};
                        // payload["email"] = email.text;
                        // payload["password"] = password.text;
                        payload["email"] = 'email';
                        payload["password"] = '12345';

                        await AuthRepository().login(payload).then(
                              (value) => {
                                if (value != false)
                                  {
                                    Navigator.pushNamed(
                                      context,
                                      '/',
                                      arguments: {
                                        'userArgument': json.encode(value),
                                      },
                                    )
                                  }
                                else
                                  {print('error')}
                              },
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
