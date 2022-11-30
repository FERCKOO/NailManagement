// ignore_for_file: file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:angy/Api/bd_servicios.dart';
import 'package:angy/Screens/principal.dart';
import 'package:flutter/material.dart';

import 'borrarServicio.dart';
import 'nuevoServicio.dart';

class ServiciosPage extends StatefulWidget {
  static String id = 'Servicios_Page';
  
  @override
  State<StatefulWidget> createState() => ServicioPageState();
}

class ServicioPageState extends State <ServiciosPage>{
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, PrincipalPage.id, (route) => false);
            },
          ),
          /*
         * Texto de inicio sesion
        */
          title: const Text(
            'Servicios',
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: sizeScreen.height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: sizeScreen.width * .25,
                  height: sizeScreen.height * .05,
                  child: Card(
                    color: Color(0xff53224B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                    child: Text(
                      'Servicio',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Lato'),
                    ),
                  ),
                ),
                SizedBox(
                  height: sizeScreen.height * .05,
                  width: sizeScreen.width * .25,
                ),
                Container(
                  width: sizeScreen.width * .25,
                  height: sizeScreen.height * .05,
                  child: Card(
                    color: Color(0xff53224B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                    child: Text(
                      'Costo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Lato'),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: servicios.length,
                itemBuilder: (context, int index) {
                  return Container(
                    margin: EdgeInsetsDirectional.only(
                        start: sizeScreen.width * .12,
                        end: sizeScreen.width * .12),
                    child: Card(
                      color: Color(0xff363636),
                      elevation: 0,
                      child: ListTile(
                        title: Text(
                          '${servicios.keys.elementAt(index)}',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Text(
                          '${servicios.values.elementAt(index)} \$',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 154, 27, 27),
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeScreen.width * .05,
                      vertical: sizeScreen.height * .029,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Borrar servicio',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato'),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, BorrarServicioPage.id);
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff171717),
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeScreen.width * .05,
                      vertical: sizeScreen.height * .029,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Nuevo servicio',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato'),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, NuevoServicioPage.id);
                  },
                ),
              ],
            ),
            SizedBox(height: sizeScreen.height*.1,)
          ],
        ),
      ),
    );
  }
}
