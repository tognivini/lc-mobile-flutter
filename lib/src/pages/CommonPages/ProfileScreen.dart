// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member

import 'package:flutter/material.dart';

// import 'package:lc_mobile_flutter/navigator_keys.dart';
// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, String? name});
  // String id;

  @override
  State<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  // ProfileScreen({
  //   super.key,
  //   required this.id,
  // });
  TextEditingController nameController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  // setState(
  // nomeController.text
  // )

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Perfil'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text('Perfil',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 10, right: 20, bottom: 5, left: 20),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                        hintText: 'Nome Completo'),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 20, bottom: 5, left: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    // style: const TextStyle(fontSize: 12),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Digite um e-mail válido por favor'),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 20, bottom: 5, left: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Telefone',
                        hintText: '(88) 8 xxxx-xxxx'),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 20, bottom: 5, left: 20),
                  child: TextFormField(
                    obscureText: true,
                    controller: passController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                        hintText: 'Digite uma senha válida por favor'),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 40,
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
                        print(nameController.text);
                        print(matriculaController.text);
                        print(emailController.text);
                        print(passController.text);
                      },
                      child: const Text('Editar'),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        // NavigatorKeys.currentState.pushNamed('/auth/login');
                        Navigator.pushNamed(
                          context,
                          '/auth/login',
                        );
                      },
                      child: const Text('Logout'),
                    ),
                  )),
            ],
          ),
        ));
  }
}
