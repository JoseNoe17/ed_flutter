import 'package:curso_edteam_flutter/ui/pages/contact_list_page.dart';
import 'package:curso_edteam_flutter/ui/pages/user_info_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';



List<Widget> pages = [
  ContactListPage(),
  UserInfoPage()
];



GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = 'Contactos';
  int picker;

  Future<String> descargaImagen() async{
    print ("se inicia la descarga de la imagen");

    await Future.delayed(Duration(seconds: 2), (){
    });
    return "se descarga la imagen";
  }

  @override

  void initState(){
    super.initState();
    picker=0;
  }


  
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeKey,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Container(color: Theme.of(context).primaryColor,),
            ),
            ListTile(
              leading: Icon(MdiIcons.homeCircle),
                title: Text('Inicio'), onTap: (){
                  setState(() {
                    Navigator.pop(context);
                    picker = 0;
                  });
            },),
            ListTile(
              leading: Icon(MdiIcons.accountBox),
              title: Text('Usuario'), onTap: (){
              setState(() {
                Navigator.pop(context);
                picker = 1;
              });
            },)
          ],
        ),
      ),
        floatingActionButton: Builder(
          builder: (BuildContext context){
            return FloatingActionButton(
              onPressed: (){
                print('Boton flotante');
              },
              child: Icon(Icons.add),);
          },
        ),
        appBar: AppBar(
          actions: <Widget>[
           picker == 1? IconButton(
               icon: Icon(Icons.edit),
               onPressed: () {
                 Navigator.pushNamed(context, 'user_form');
                 //print("se presiono el boton ");
                 //descargaImagen().then(
                 //        (value) {
                  //         print(value);
                   //        print("se esta mostrando la imagen ");
                    //     });

               }
               ):SizedBox(),
          ],
          title: Text(title),
        ),
        body: pages[picker]
      );
  }
}




