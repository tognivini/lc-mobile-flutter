// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member

import 'package:flutter/material.dart';
// import 'navigator_keys.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, String? name});
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
          title: const Text('Registro'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('Crie sua conta',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 20, bottom: 5, left: 20),
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  controller: matriculaController,
                  // initialValue: 'sathyabaman@gmail.com',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Matrícula',
                    hintText: 'Matrícula',
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
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  // initialValue: 'sathyabaman@gmail.com',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
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
                  // initialValue: 'sathyabaman@gmail.com',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
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
                  // initialValue: 'sathyabaman@gmail.com',
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
                  controller: passController,
                  // initialValue: 'sathyabaman@gmail.com',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
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
                padding: const EdgeInsets.only(
                    top: 5, right: 20, bottom: 5, left: 20),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passController,
                  // initialValue: 'sathyabaman@gmail.com',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Confirmar senha',
                    hintText: 'Repita a senha por favor',
                    contentPadding:
                        const EdgeInsets.only(top: 5, bottom: 5, left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/auth/login',
                    );
                  },
                  child: const Text('Já possui uma conta?',
                      style: TextStyle(color: Colors.blue))),
              Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: 35,
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
                        Navigator.pushNamed(
                          context,
                          '/auth/login',
                        );
                        // print('katchouwn', text);
                        // // setState(() {

                        // });
                      },
                      child: const Text('Registre-se'),
                    ),
                  )),
              // const size box here
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ));
  }
}
