// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:lc_mobile_flutter/src/components/SelectInput/SelectInput';

// ignore: must_be_immutable
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key, String? name});
  static const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  // String id;

  @override
  State<ScheduleScreen> createState() => _ScheduleState();
}

class _ScheduleState extends State<ScheduleScreen> {
  // ScheduleScreen({
  //   super.key,
  //   required this.id,
  // });
  TextEditingController nameController = TextEditingController();
  TextEditingController matriculaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String dropdownValue = list.first;

  // setState(
  // nomeController.text
  // )

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Schedule'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text('Agendamento',
                    style: TextStyle(color: Colors.black, fontSize: 26)),
              ),
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
                        print(nameController.text);
                        print(matriculaController.text);
                        print(emailController.text);
                        print(passController.text);
                      },
                      child: const Text('Editar'),
                    ),
                  )),
            ],
          ),
        ));
  }
}
