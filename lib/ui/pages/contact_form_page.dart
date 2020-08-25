import 'package:curso_edteam_flutter/controllers/contact_list_controller.dart';
import 'package:curso_edteam_flutter/models/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

GlobalKey<FormState> formContactKey = GlobalKey<FormState>();
GlobalKey<ScaffoldState> formPagetKey = GlobalKey<ScaffoldState>();

class ContactFormPage extends StatefulWidget {
  @override
  _ContactFormPageState createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {

  TextEditingController _nameController;
  TextEditingController _nickNameController;
  TextEditingController _movilController;

  ContactListController _controller = ContactListController.instancia;
  PersonModel _personModel = PersonModel();
  @override

  void initState(){
    super.initState();
    _nameController = TextEditingController(text: "");
    _nickNameController = TextEditingController(text: "");
    _movilController = TextEditingController(text: "");
  }

  bool validateAll(){
    if(formContactKey.currentState.validate()){
      return true;
    }else{
      formPagetKey.currentState.showSnackBar
        (SnackBar(content: Text('inserte todos los datos necesarios'),));
      return false;
    }
  }

  String validate(String value, String key)=>
      value.isEmpty?"Inserte su ${key}": null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formPagetKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Nuevo Contacto'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formContactKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  inputFormatters: [WhitelistingTextInputFormatter
                    (RegExp("[a-z A-Z]"))],
                  validator: (value)=> validate(value, "Nombre"),
                  decoration: InputDecoration(
                    hintText: 'Nombre',
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Ej: Jose reyes',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor
                      )
                    )
                  ),
                  onChanged: (value)=> _personModel.name = value,
                  controller: _nameController,
                ),
                SizedBox(height: 8.0),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8.0),
                    border:
                      Border.all(color: Theme.of(context).primaryColor)
                  ),
                  child: TextFormField(
                    validator: (value)=> validate(value, "NickName"),
                    decoration: InputDecoration(
                        hintText: 'NickName',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        labelText: 'Ej:Braye98'
                    ),
                    onChanged: (value)=> _personModel.nickName = value,
                    controller: _nickNameController,
                  ),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  inputFormatters: [WhitelistingTextInputFormatter
                    (RegExp("[0-9]"))],
                  validator: (value)=> validate(value, "Telefono"),
                  decoration: InputDecoration(
                      hintText: 'Movil',
                      prefixIcon: Icon(Icons.call),
                      labelText: '+584126717506'
                  ),
                  onChanged: (value)=> _personModel.movil = value,
                  controller: _movilController,
                ),
                SizedBox(height: 32),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: (){
                   if (validateAll()){
                     _controller.contactos.value=
                     List.from(_controller.contactos.value)..add(_personModel);
                     Navigator.pop(context);
                   }
                  },
                  child: Text('Agregar Contacto',
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
