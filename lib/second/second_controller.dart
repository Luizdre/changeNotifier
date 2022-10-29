import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:teste/model/person.dart';

class SecondController extends ChangeNotifier {
  Person? person;
  SecondController({this.person});

  Uint8List? imageSelected;

  void selectImage(Uint8List image) {
    imageSelected = image;
    notifyListeners();
  }
}
