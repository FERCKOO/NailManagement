// ignore_for_file: file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:angy/Api/bd_listaCompras.dart';
import 'package:angy/Screens/nuevoMaterial.dart';
import 'package:angy/Screens/principal.dart';
import 'package:flutter/material.dart';

class ListaDeComprasPage extends StatelessWidget {
  static String id = 'Lista de compras_Page'; //Variable que obtendra la ruta de la pantalla

  @override
  Widget build(BuildContext context) {
    /**
     *  Variable que contendra el tamaño de la pantalla del dispositivo
     * Ayudará para que la app sea responsiva
     */
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
                  context, PrincipalPage.id, (route) => false); // Regreso a la pantalla principal
            },
          ),
          /*
         * Texto del encabezado
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
              child: 
              /**
               * Condicional ternario.
               * Si la lista de meterial a comprar esta vacio...
               * Muestra que no hay algo para comprar
               * Si esta lleno...
               * Mostrará el listado de los materiales a comprar
               */
              (listAComprar.isEmpty)
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
                              title: Text(
                                listAComprar.elementAt(index),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),

            /**
             * Row para mostrar botones
             * Limpiar lista
             * Agregar un nuevo material a la lista
             */
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
                  /**
                   * Al presionar el boton de "Limpiar lista" hace lo siguiente:
                   * 1.- Limpiar la BD 
                   * 2.- llama a la pantalla de la lista de compras
                   */
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
                  /**
                   * Al presionar el boton de "Nuevo material"...
                   * lo redireccionará a la pantalla para agregar un nuevo material a la lista
                  */ 
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
