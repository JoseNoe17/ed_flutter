import 'package:curso_edteam_flutter/controllers/contact_list_controller.dart';
import 'package:curso_edteam_flutter/models/person_model.dart';
import 'package:curso_edteam_flutter/ui/widgets/custom_button.dart';
import 'package:curso_edteam_flutter/ui/widgets/custom_listtile.dart';
import 'package:flutter/material.dart';



class ContactListPage extends StatelessWidget {

  ContactListController controller = ContactListController.instancia;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.contactos,
      builder: (context, value, child){
        return Container(
          child: Column(
            children: <Widget>[
              CustomButton(),
              Expanded(
                child: ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, picker){
                    return Dismissible(
                      background: Container(color: Colors.red),
                      onDismissed: (direction)=> value.removeAt(picker),
                      key: Key(picker.toString()),
                      child: CustomListTile(person: value[picker]),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
