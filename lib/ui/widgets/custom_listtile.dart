import 'package:curso_edteam_flutter/models/person_model.dart';
import 'package:curso_edteam_flutter/ui/pages/contact_details_pages.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const IconData whatsAppIcon = IconData(0xea93, fontFamily: 'Icomoon');

class CustomListTile extends StatelessWidget{
  final PersonModel person;

  CustomListTile({this.person});

  @override
  Widget build(BuildContext context){
    return ListTile(
      onTap: (){
        Navigator.pushNamed(context, 'contact_details', arguments: ContactDetailsArguments(
          person: person,
          contenido: "contenido"
        ));
      },
      trailing: SizedBox(
        width: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(icon: Icon(whatsAppIcon), onPressed: (){
              launch("https://wa.me/+58${person.movil}?text='Hola'");
            }),
            IconButton(icon: Icon(Icons.call), onPressed: (){
              launch("tel:${person.movil}");
            }),],
        ),
      ),
      leading: CircleAvatar(child: Text(
        person.name[0].toUpperCase()
      ),),
      title: Text(person.name),
      subtitle: Text(person.nickName),
    );
  }
}

