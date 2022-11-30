// ignore_for_file: file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:angy/Api/bd_agenda.dart';
import 'package:angy/Api/bd_ventas.dart';
import 'package:flutter/material.dart';

import 'nuevaVenta.dart';

class VentasPage extends StatelessWidget {
  static String id = 'Ventas_Page';

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
              Navigator.pop(context);
            },
          ),
          /*
         * Texto de inicio sesion
        */
          title: const Text(
            'Ventas',
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sizeScreen.width * .1,
                  vertical: sizeScreen.height * .03),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Ventas totales',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Lato'),
                      ),
                      SizedBox(
                        width: sizeScreen.width * .2,
                      ),
                      Text(
                        '${costos.length}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Lato'),
                      ),
                    ],
                  ),
                SizedBox(height: sizeScreen.height*.01,),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: sizeScreen.width * .1),
                        child: Text(
                          'Ingresos',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Lato'),
                        ),
                      ),
                      SizedBox(
                        width: sizeScreen.width * .2,
                      ),
                      Text(
                        '${totalVentas()} \$',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Lato'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buttonNuevaVenta(context),
            SizedBox(height: sizeScreen.height * .02),
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
                  height: sizeScreen.height*.05,
                  width: sizeScreen.width*.1,
                  )
,                Container(
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
                itemCount: costos.length,
                itemBuilder: (context, int index) {
                  return Container(
                    margin: EdgeInsetsDirectional.only(
                      start: sizeScreen.width*.12,
                      end: sizeScreen.width*.12
                    ),
                    child: Card(
                      color: Color(0xff363636),
                      elevation: 0,
                      child: ListTile(
                        title: Text(
                          servicio.values.elementAt(index),
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Text(
                          '${costos.values.elementAt(index)} \$',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buttonNuevaVenta(BuildContext context) {
  final sizeScreen = MediaQuery.of(context).size;

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Color(0xff171717),
      padding: EdgeInsets.symmetric(
        horizontal: sizeScreen.width * .08,
        vertical: sizeScreen.height * .025,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: const Text(
      'Nueva venta',
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      //Navegar a pagina de nueva venta
      Navigator.of(context).pushNamed(NuevaVentaPage.id);
    },
  );
}
