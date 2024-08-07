// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lc_mobile_flutter/src/pages/CommonPages/Profile/EditProfile.dart';
import 'package:lc_mobile_flutter/src/service/repositories/UserRepository.dart';
import 'package:localstore/localstore.dart';

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

  var _passwordVisible = false;

  onLoadUser() async {
    final db = Localstore.instance;
    final localStorageData =
        await db.collection('storageUser').doc('storageUser').get();

    var payload = {};
    payload["userId"] = localStorageData!['userId'];
    payload["token"] = localStorageData['token'];

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
    // final arguments = (ModalRoute.of(context)?.settings.arguments ??
    //     <String, dynamic>{}) as Map;

    // var userLogged = arguments['userArgument'];
    // var decodedUser = json.decode(userLogged.toString());
    onLoadUser();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
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
                    final db = Localstore.instance;
                    db.collection('storageUser').delete();

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
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       top: 5, right: 20, bottom: 5, left: 20),
              //   child: TextFormField(
              //     readOnly: true,
              //     keyboardType: TextInputType.name,
              //     controller: matriculaController,
              //     style: const TextStyle(
              //         fontWeight: FontWeight.normal, color: Colors.grey),
              //     decoration: InputDecoration(
              //       labelText: 'Matrícula',
              //       hintText: 'Matrícula',
              //       contentPadding:
              //           const EdgeInsets.only(top: 5, bottom: 5, left: 10),
              //       border: OutlineInputBorder(
              //           borderSide: const BorderSide(color: Colors.grey),
              //           borderRadius: BorderRadius.circular(8.0)),
              //     ),
              //   ),
              // ),
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
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 20, bottom: 5, left: 20),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !_passwordVisible, //This will obscu
                  controller: passController,
                  readOnly: true,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.grey),
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
                        Navigator.pushNamed(
                          context,
                          '/edit',
                        );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const EditProfileScreen(),
                        //       settings: RouteSettings(
                        //           arguments: json.encode(context))),
                        // );
                      },
                      child: const Text('Editar'),
                    ),
                  )),
            ],
          ),
        ));
  }
}
