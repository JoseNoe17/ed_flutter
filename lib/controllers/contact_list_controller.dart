import 'package:curso_edteam_flutter/models/person_model.dart';
import 'package:flutter/material.dart';

class ContactListController {

  static List<PersonModel> persons = [
    person1,
    person2,
    person3,
    person2

  ];

  static final ContactListController instancia =
      ContactListController._();
  ContactListController._();


  ValueNotifier <List<PersonModel>> contactos =
  ValueNotifier <List<PersonModel>>(persons);
}