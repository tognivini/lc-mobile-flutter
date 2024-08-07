// ignore_for_file: file_names, avoid_print, override_on_non_overriding_member, unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:lc_mobile_flutter/src/service/repositories/UserRepository.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, String? name});

  @override
  State<RegisterScreen> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();

  var _passwordVisible = false;
  var _repasswordVisible = false;

  void callAlertDialog(isSuccess, message, mayClear, mayNavigate) {
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

                if (mayClear) {
                  clearInputs();
                }
                if (mayNavigate) {
                  Navigator.pushNamed(
                    context,
                    '/auth/login',
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  void clearInputs() {
    name.text = '';
    email.text = '';
    phoneNumber.text = '';
    password.text = '';
    repassword.text = '';
  }

  handleSubmit() async {
    var payload = {};
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
        return callAlertDialog(false, "Senhas não coincidem!", true, false);
      } else {
        await UserRepository().createUser(payload).then(
              (value) => {
                if (value != false)
                  {
                    callAlertDialog(
                        true, "Usuário criado com sucesso!", true, true)
                  }
                else
                  {
                    callAlertDialog(
                        false, "Tente novamente mais tarde!", true, false)
                  }
              },
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: const Text('Registro'),
        // ),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 60, bottom: 10),
                child: Text('Crie sua conta',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       top: 5, right: 20, bottom: 5, left: 20),
              //   child: TextFormField(
              //     autofocus: true,
              //     keyboardType: TextInputType.name,
              //     controller: matriculaController,
              //     // initialValue: 'sathyabaman@gmail.com',
              //     style: const TextStyle(
              //         fontWeight: FontWeight.normal, color: Colors.black),
              //     decoration: InputDecoration(
              //       labelText: 'Matrícula',
              //       hintText: 'Matrícula',
              //       contentPadding:
              //           const EdgeInsets.only(top: 5, bottom: 5, left: 10),
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(8.0)),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 20, bottom: 5, left: 20),
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  controller: name,
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
                  controller: email,
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
                  controller: phoneNumber,
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
                  obscureText: !_passwordVisible, //This will obscu
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
                  obscureText: !_repasswordVisible, //This will obscu
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
                        handleSubmit();
                      },
                      child: const Text('Registre-se'),
                    ),
                  )),
            ],
          ),
        ));
  }
}
