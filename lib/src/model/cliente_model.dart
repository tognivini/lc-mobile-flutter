class ClienteModel{

  final int? id;
  final String? nome;


  ClienteModel({this.id, this.nome});


  factory ClienteModel.fromJson(Map<String, dynamic> json){
    return ClienteModel(
        id: json["id"],
        nome: json["nome"]
    );
  }

}