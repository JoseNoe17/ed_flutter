import 'package:curso_edteam_flutter/controllers/theme_controller.dart';
import 'package:curso_edteam_flutter/ui/pages/contact_details_pages.dart';
import 'package:curso_edteam_flutter/ui/pages/contact_form_page.dart';
import 'package:curso_edteam_flutter/ui/pages/home_page.dart';
import 'package:curso_edteam_flutter/ui/pages/user_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'controllers/main_controller.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {

  ThemeController _controller = ThemeController.instancia;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller.isDark,
      builder: (context,value,child){
        return MaterialApp(
            routes: {
              'contact_details':(context)=> ContactDetailsPages(),
              'contact_form':(context)=> ContactFormPage(),
              'user_form':(context)=>  UserFormPage()
            },
            title: 'Flutter Demo',
            theme: ThemeData(
              brightness: value?Brightness.dark:Brightness.light,
              iconTheme: IconThemeData(color:Colors.blue),
              primarySwatch: Colors.green,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomePage()
        );
      },
    );

  }
}


