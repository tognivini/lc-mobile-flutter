class UserModel {
  final int? id;
  final String? email;
  final String? senha;
  final String? nome;
  final String? token;

  UserModel({this.id, this.email, this.senha, this.nome, this.token});

  Map<String, dynamic> toJson() {
    return {'email': email, 'nome': nome, 'senha': senha};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      email: json["login"],
      nome: json["nome"],
      senha: json["senha"],
      // token: json["token"]
    );
  }

  /*Map<String, dynamic> fromJson(){
    return UserModel(id: )
  }*/

  @override
  String toString() {
    return 'UserModel{id: $id, email: $email, senha: $senha, nome: $nome}';
  }
}
