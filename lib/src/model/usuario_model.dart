

class UsuarioModel{
  final int? id;
  final String? email;
  final String? senha;
  final String? nome;
  final String? token;

  UsuarioModel({this.id, this.email, this.senha, this.nome, this.token});


  Map<String, dynamic> toJson(){
    return {
      'email': email,
      'nome': nome,
      'senha': senha
    };
  }

  factory UsuarioModel.fromJson(Map<String, dynamic> json){
    return UsuarioModel(
      id: json["id"],
      email: json["login"],
      nome: json["nome"],
      senha: json["senha"],
      token: json["token"]
    );
  }

  /*Map<String, dynamic> fromJson(){
    return UsuarioModel(id: )
  }*/

  @override
  String toString() {
    return 'UsuarioModel{id: $id, email: $email, senha: $senha, nome: $nome}';
  }
}