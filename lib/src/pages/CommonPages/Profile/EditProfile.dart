// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lc_mobile_flutter/src/service/repositories/UserRepository.dart';
import 'package:localstore/localstore.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, String? name});

  @override
  State<EditProfileScreen> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfileScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();

  var _passwordVisible = false;
  var _repasswordVisible = false;

  onLoadUser() async {
    final db = Localstore.instance;
    final localStorageData =
        await db.collection('storageUser').doc('storageUser').get();

    var payload = {};
    payload["userId"] = localStorageData!['userId'];
    payload["token"] = localStorageData['token'];

    final userInfo = await UserRepository().getUserById(payload);
    if (userInfo != null) {
      name.text = userInfo['name'];
      email.text = userInfo['email'];
      phoneNumber.text = userInfo['phoneNumber'];
      password.text = userInfo['password'];
      repassword.text = userInfo['password'];
    }
  }

  void callAlertDialog(isSuccess, message, mayNavigate) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isSuccess ? "Sucesso!" : "Erro!"),
          content: Text('$message'),
          actions: <Widget>[
            TextButton(
              child: const Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();

                if (mayNavigate) {
                  Navigator.pushNamed(
                    context,
                    '/',
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  handleSubmit() async {
    final db = Localstore.instance;
    final localStorageData =
        await db.collection('storageUser').doc('storageUser').get();
    var payload = {};
    payload["token"] = localStorageData!['token'];
    payload["userId"] = localStorageData['userId'];
    payload["name"] = name.text;
    payload["email"] = email.text;
    payload["phoneNumber"] = phoneNumber.text;
    payload["password"] = password.text;
    if (name.text != '' &&
        email.text != '' &&
        phoneNumber.text != '' &&
        password.text != '' &&
        repassword.text != '') {
      if (password.text != repassword.text) {
        return callAlertDialog(false, "Senhas não coincidem!", false);
      } else {
        await UserRepository().onUpdateUser(payload).then(
              (value) => {
                if (value != false)
                  {callAlertDialog(true, "Usuário editado com sucesso!", true)}
                else
                  {callAlertDialog(false, "Tente novamente mais tarde!", false)}
              },
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    onLoadUser();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 60, bottom: 10),
                child: Text('Edição de perfil',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 20, bottom: 5, left: 20),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: name,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Nome Completo',
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
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  readOnly: true,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.grey),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Digite um e-mail válido por favor',
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
                  keyboardType: TextInputType.phone,
                  controller: phoneNumber,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    hintText: '(88) 8 xxxx-xxxx',
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
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
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
                padding: const EdgeInsets.only(
                    top: 5, right: 20, bottom: 5, left: 20),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !_repasswordVisible,
                  controller: repassword,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite uma senha válida por favor',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _repasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _repasswordVisible = !_repasswordVisible;
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
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () async {
                            Navigator.pushNamed(
                              context,
                              '/',
                            );
                          },
                          child: const Text('Cancelar'),
                        ),
                      ),
                      Container(
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
                            handleSubmit();
                          },
                          child: const Text('Editar'),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
