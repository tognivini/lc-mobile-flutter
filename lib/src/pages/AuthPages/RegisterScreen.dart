// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  // String id;

  @override
  State<RegisterScreen> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  // RegisterScreen({
  //   super.key,
  //   required this.id,
  // });

  TextEditingController nameController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController rePassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('Crie sua conta',
                    style: TextStyle(color: Colors.black, fontSize: 26)),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 30, right: 20, bottom: 10, left: 20),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                        hintText: 'Nome Completo'),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 10, right: 20, bottom: 10, left: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Digite um e-mail válido por favor'),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 10, right: 20, bottom: 10, left: 20),
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
                      top: 10, right: 20, bottom: 10, left: 20),
                  child: TextFormField(
                    obscureText: true,
                    controller: passController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                        hintText: 'Digite uma senha válida por favor'),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 10, right: 20, bottom: 5, left: 20),
                  child: TextFormField(
                    obscureText: true,
                    controller: rePassController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirmar senha',
                        hintText: 'Repita a senha por favor'),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/login/1',
                    );
                  },
                  child: const Text('Já possui uma conta?',
                      style: TextStyle(color: Colors.blue))),
              Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        // print('katchouwn', text);
                        // // setState(() {

                        // });
                      },
                      child: const Text('Registre-se'),
                    ),
                  )),
              // const size box here
              const SizedBox(
                height: 140,
              ),
              ElevatedButton(
                  onPressed: () {
                    print(nameController.text);
                    print(matriculaController.text);
                    print(emailController.text);
                    print(passController.text);
                  },
                  child: const Text("Adicionar"))
            ],
          ),
        ));
  }
}
