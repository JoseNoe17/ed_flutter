import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

GlobalKey<ScaffoldState> userPageKey = GlobalKey<ScaffoldState>();
GlobalKey<FormState> userFormKey = GlobalKey<FormState>();

class UserFormPage extends StatefulWidget {
  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {

  TextEditingController _nameController;
  TextEditingController _nickNameController;
  TextEditingController _movilController;

  @override

  void initState(){
    super.initState();
    _nameController = TextEditingController(text: "");
    _nickNameController = TextEditingController(text: "");
    _movilController = TextEditingController(text: "");
  }

  bool validateAll(){
    if(userFormKey.currentState.validate()){
      return true;
    }else{
      userPageKey.currentState.showSnackBar
        (SnackBar(content: Text('inserte todos los datos necesarios'),));
      return false;
    }
  }

  String validate(String value, String key)=>
      value.isEmpty?"Inserte su ${key}": null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: userPageKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Nuevo Contacto'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: userFormKey,
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
                    onChanged: (value)=> (){},
                    controller: _nameController,
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
                    onChanged: (value)=> (){},
                    controller: _movilController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      OutlineButton(
                          onPressed: (){
                            var image =
                            ImagePicker.platform.pickImage(
                                source: ImageSource.camera);

                          },
                          child: Text('Abrir camara')),
                      OutlineButton(
                          onPressed: (){
                            var image =
                            ImagePicker.platform.pickImage(
                                source: ImageSource.gallery);

                          },
                          child: Text('Abrir Galeria')),
                    ],
                  ),
                  SizedBox(height: 32),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: (){
                      if (validateAll()){
                        //todo: cambiar valores de usuario
                      }
                    },
                    child: Text('Actualizar Usuario',
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