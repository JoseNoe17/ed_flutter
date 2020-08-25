import 'package:curso_edteam_flutter/controllers/main_controller.dart';
import 'package:curso_edteam_flutter/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  ValueNotifier<String> title = ValueNotifier<String>("Agregar Contacto");
  ThemeController _controller = ThemeController.instancia;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        title.value = "Value Notifier";
        //homeKey.currentState.showSnackBar(SnackBar(content: Text('soy snackbar'),));
       // _controller.changeTheme(true);
        presionadoDeBoton();
        Navigator.pushNamed(context, 'contact_form');
      },
      child: ValueListenableBuilder(
        valueListenable: title,
        builder: (context,value,child){
          return Container(
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(8.0)),
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                title.value,
                style: GoogleFonts.amaranth(color: Theme.of(context).primaryColor, fontSize: 20.0),
              ),
            ),
          );
        },
      )
    );
  }
}

