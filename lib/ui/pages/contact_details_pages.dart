import 'package:curso_edteam_flutter/models/person_model.dart';
import 'package:flutter/material.dart';

class ContactDetailsPages extends StatelessWidget {

  ContactDetailsPages();

  @override
  Widget build(BuildContext context) {
    final ContactDetailsArguments arguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.person.nickName),
        centerTitle: true,
      ),
      body: Center(
        child: Text(arguments.contenido),
      ),
    );
  }
}

class ContactDetailsArguments{
  final PersonModel person;
  final String contenido;

  ContactDetailsArguments({this.person, this.contenido = "contenido"});
}