import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:teste/model/person.dart';

class FirstController extends ChangeNotifier {
  List<Person>? persons;
  bool loading = false;

  void listPersons() async {
    loading = true;
    notifyListeners();
    Response<List> response = await Dio()
        .get('https://mocki.io/v1/b5a39818-ab8a-437e-a73a-a9981a5dbbf0');

    persons = response.data!.map((e) => Person.fromMap(e)).toList();
    loading = false;
    notifyListeners();
  }
}
