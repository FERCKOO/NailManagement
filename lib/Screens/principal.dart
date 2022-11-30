// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, unused_local_variable

import 'package:angy/Screens/agenda.dart';
import 'package:flutter/material.dart';

import 'LogIn.dart';

// ignore: use_key_in_widget_constructors
class PrincipalPage extends StatelessWidget {
  static String id = "Principal_page";

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        /*
         * Teto de pantalla 
        */
        title: const Text(
          'Pantalla principal',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _button(context, sizeScreen, 'Agenda'),
            SizedBox(height: sizeScreen.height * .05),
            _button(context, sizeScreen, 'Ventas'),
            SizedBox(height: sizeScreen.height * .05),
            _button(context, sizeScreen, 'Servicios'),
            SizedBox(height: sizeScreen.height * .05),
            _button(context, sizeScreen, 'Lista de compras'),
            SizedBox(height: sizeScreen.height * .05),
            _button(context, sizeScreen, 'Ganancias'),
            /**
                   * GestureDetector para detectar pulsacion
                   * en el texto de "Cerrar sesion"
                   */
            Container(
              margin: EdgeInsetsDirectional.only(top: sizeScreen.height * .1),
              child: GestureDetector(
                // Detecta alguna accion en texto

                onTap: (() {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LogInPage.id, (Route<dynamic> route) => false);
                }),
                // Detecta alguna accion en texto

                child: const Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

// ignore: unused_element
Widget _button(context, Size size, textLabel) {
  //Listado de las pantallas
  final List<Widget> _viewsOptions = <Widget>[];

  Color coloor = Colors.grey.shade700;

  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: size.width * .18,
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        alignment: Alignment(size.width / 2, size.height),
        padding: EdgeInsets.symmetric(
          vertical: size.width * .05,
          horizontal: size.width * .2,
        ),
        primary: coloor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        textLabel,
        style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato'),
      ),
      onPressed: () {
        var textLabelPage = '${textLabel}_Page';

        Navigator.of(context).pushNamed(textLabelPage);
      },
    ),
  );
}
