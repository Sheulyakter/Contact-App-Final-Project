import 'package:assignment_flutter_intern/src/utils/constraints.dart';
import 'package:flutter/material.dart';

class Hero {
  int id;
  String name;
  String subName;
  String number;
  String gmail;
  bool isFavorite = false;

  Hero({
    @required this.id,
    @required this.name,
    @required this.number,
    @required this.subName,
    @required this.gmail,
      this.isFavorite,
  });

  toggle() {
    isFavorite =! isFavorite;
  }
}

class Constraints{
  static const String Edit = 'Edit';
  static const String Stared = 'Stared Contacts';

  static const List<String> choices = <String>[
    Edit,Stared,
  ];
}

