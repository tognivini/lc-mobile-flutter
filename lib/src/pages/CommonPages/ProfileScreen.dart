import 'package:flutter/material.dart';
import 'package:lc_mobile_flutter/src/model/filme.dart';

class ProfileScreen extends StatefulWidget {
  final String? obj;

  const ProfileScreen({super.key, String? name, this.obj});

  @override
  State<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  // Future<List<Filme>>? futureFilmes;

  TextEditingController nameController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var obj = ModalRoute.of(context)?.settings.arguments as String?;

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
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 20, bottom: 5, left: 20),
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  controller: matriculaController,
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
                        print(obj);
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
