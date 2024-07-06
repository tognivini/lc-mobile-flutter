import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lc_mobile_flutter/src/model/filme.dart';
import 'package:lc_mobile_flutter/src/pages/AuthPages/LoginScreen.dart';
import 'package:lc_mobile_flutter/src/service/repositories/UserRepository.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, String? name});

  @override
  State<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  onLoadUser(decodedUser) async {
    print(decodedUser);
    var payload = {};
    payload["userId"] = decodedUser['userId'];
    payload["token"] = decodedUser['token'];

    final userInfo = await UserRepository().getUserById(payload);
    if (userInfo != null) {
      nameController.text = userInfo['name'];
      emailController.text = userInfo['email'];
      phoneController.text = userInfo['phoneNumber'];
      passController.text = userInfo['password'];
      matriculaController.text = '20195200';
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    var userLogged = arguments['userArgument'];
    var decodedUser = json.decode(userLogged.toString());

    onLoadUser(decodedUser);

    //   @override
    // void initState() {
    //   var _passwordVisible = false;
    // }

    //   // {id: 75b7fab7-4f2e-4ff3-ab67-1f48b9940f50, status: 1, createdAt: 2024-04-19T00:30:22.401Z,
    //   // updatedAt: 2024-04-19T00:30:22.401Z, email: email, phoneNumber: (99) 99999-99999, name: user123, password: 12345,

    //   // userPermission: {id: f1b7f939-7587-40eb-ba8c-a49db0d69963, status: 1, createdAt: 2024-04-19T00:30:22.449Z,
    //   // updatedAt: 2024-04-19T00:30:22.449Z, userType: CLIENTE}}

    bool _passwordVisible = false;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Perfil'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0, left: 200),
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      height: 3,
                      fontSize: 13,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/auth/login',
                    );
                  },
                  child: const Text('Logout'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Text('Perfil',
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 20, bottom: 5, left: 20),
                child: TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.name,
                  controller: matriculaController,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.grey),
                  decoration: InputDecoration(
                    labelText: 'Matrícula',
                    hintText: 'Matrícula',
                    contentPadding:
                        const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 20, bottom: 5, left: 20),
                child: TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  // initialValue: nameController.text,
                  // initialValue: decodedUser['name'] ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.grey),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    // hintText: 'Nome Completo',
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
                  controller: emailController,
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
                  controller: phoneController,
                  readOnly: true,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.grey),
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
              // Padding(
              //     padding: const EdgeInsets.only(top: 0),
              //     child: TextFormField(
              //       keyboardType: TextInputType.text,
              //       controller: passController,
              //       obscureText:
              //           !_passwordVisible, //This will obscure text dynamically
              //       decoration: InputDecoration(
              //         labelText: 'Password',
              //         hintText: 'Enter your password',
              //         // Here is key idea
              //         suffixIcon: IconButton(
              //           icon: Icon(
              //             // Based on passwordVisible state choose the icon
              //             _passwordVisible
              //                 ? Icons.visibility
              //                 : Icons.visibility_off,
              //             color: Theme.of(context).primaryColorDark,
              //           ),
              //           onPressed: () {
              //             // Update the state i.e. toogle the state of passwordVisible variable
              //             setState(() {
              //               _passwordVisible = !_passwordVisible;
              //             });
              //           },
              //         ),
              //       ),
              //     )),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 20, bottom: 5, left: 20),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passController,
                  readOnly: true,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.grey),
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite uma senha válida por favor',
                    contentPadding:
                        const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
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
                        // print('userLogged');
                        // print(userLogged);
                        // var decodedUser = json.decode(userLogged.toString());
                        // // resBody["email"] = pp['token'];
                        // print('decodedUser');
                        // print(decodedUser);
                        // print(nameController.text);
                        // Navigator.of(context).pop();
                      },
                      child: const Text('Editar'),
                    ),
                  )),
            ],
          ),
        ));
  }
}
