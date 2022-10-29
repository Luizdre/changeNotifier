import 'dart:convert';
import 'dart:typed_data';

class Person {
  String? nome;
  String? sobrenome;
  List<Uint8List>? imagem;

  Person({this.nome, this.sobrenome, this.imagem});

  factory Person.fromMap(Map<String, dynamic> map) {
    List imagens = map["imagem"] as List;
    imagens = imagens.map((e) => e.toString()).toList();

    return Person(
        imagem: imagens.map((e) => base64Decode(e)).toList(),
        nome: map['nome'],
        sobrenome: map['sobrenome']);
  }
}
