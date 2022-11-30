// ignore_for_file: file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:angy/Api/bd_listaCompras.dart';
import 'package:angy/Screens/nuevoMaterial.dart';
import 'package:angy/Screens/principal.dart';
import 'package:flutter/material.dart';

class ListaDeComprasPage extends StatelessWidget {
  static String id = 'Lista de compras_Page';

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
              Navigator.pushNamedAndRemoveUntil(
                  context, PrincipalPage.id, (route) => false);
            },
          ),
          /*
         * Texto de inicio sesion
        */
          title: const Text(
            'Lista de compras',
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
              height: sizeScreen.height * .1,
            ),
            Expanded(
              child: (listAComprar.isEmpty)
                  ? Text(
                      'No hay nada para comprar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      ),
                    )
                  : ListView.builder(
                      itemCount: listAComprar.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          margin: EdgeInsetsDirectional.only(
                              start: sizeScreen.width * .12,
                              end: sizeScreen.width * .12),
                          child: Card(
                            color: Color(0xff363636),
                            elevation: 0,
                            child: ListTile(
                              title: Text(listAComprar.elementAt(index),
                              style: TextStyle(
                                color: Colors.white
                              ),),
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
                    'Limpiar lista',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato'),
                  ),
                  onPressed: () {
                    listAComprar.removeWhere((element) => true);
                    Navigator.pushNamedAndRemoveUntil(
                        context, ListaDeComprasPage.id, (route) => false);
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff363636),
                    padding: EdgeInsets.symmetric(
                      horizontal: sizeScreen.width * .05,
                      vertical: sizeScreen.height * .029,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Nuevo material',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato'),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, NuevoMaterialPage.id);
                  },
                ),
                
              ],
            ),
            SizedBox(
              height: sizeScreen.height * .1,
            )
          ],
        ),
      ),
    );
  }
}
