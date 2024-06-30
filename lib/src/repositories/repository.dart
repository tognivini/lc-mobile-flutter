import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/filme.dart';

Future<List<Filme>> getFilmes() async {
// Future List<String> getFilmes() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/alura-cursos/obtendo_dados_com_flutter_http/main/filmes.json'));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);

    print(response?.body);
    print(json?.length);
    // print(response.body.runtimeType);

    return List<Filme>.from(json.map((elemento) {
      return Filme.fromJson(elemento);
    }));
    // var colors = [];
    // return List<String> colors = ['red', 'green', 'blue'];
  } else {
    return Future.error("Ops! Um erro ocorreu.");
  }
}
