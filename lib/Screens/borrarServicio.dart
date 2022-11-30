// ignore_for_file: file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:angy/Api/bd_agenda.dart';
import 'package:angy/Api/bd_servicios.dart';
import 'package:angy/Screens/servicios.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class BorrarServicioPage extends StatefulWidget {
  static String id =
      'BorrarServicio_Page'; //Variable que obtendra la ruta de la pantalla

  @override
  State<StatefulWidget> createState() => BorrarServicioPageState();
}

class BorrarServicioPageState extends State<BorrarServicioPage> {
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
              Navigator.pushNamedAndRemoveUntil(context, ServiciosPage.id,
                  (route) => false); // Regreso a la pantalla de los servicios
            },
          ),
          /*
         * Texto del encabezado
        */
          title: const Text(
            'Borrar servicio',
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
            /**
             * clase propia para mandar a llamar al DropDown
             */
            _DropDown(
              text: '   Servicio', //Texto impreso en el DrowDown
              items: servicios.keys, // Servicios que se verán en el DropDown
            ),
            SizedBox(height: sizeScreen.height * .03),
            _buttonBorrarServicio(
                context, sizeScreen) //Boton para borrar el servicio
          ],
        ),
      ),
    );
  }
}

/*
 * Seccion de metodos, funciones y widgets propios
*/
Widget _buttonBorrarServicio(BuildContext context, Size size) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.red,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .1,
        vertical: size.height * .029,
      ),
      //Redondear esquinas
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: const Text(
      'Borrar',
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      /**
       * Awesome Dialog para preguntar si se quiere borrar el servicio seleccionado
       */
      AwesomeDialog(
        dialogType: DialogType.noHeader,
        context: context,
        // ignore: deprecated_member_use
        animType: AnimType.SCALE,
        title: 'Borrar servicio',
        body: const Center(
          child: Text(
            '¿Estas seguro que quieres borrar este servicio?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Lato'),
          ),
        ),
        btnOkColor: Colors.grey.shade600,
        btnOkText: 'Borrar',
        btnOkOnPress: () {
          /**
           * Al hacer click en el boton del Awesome Dialog hace lo siguiente:
           * 1.- Borra el servicio seleccionado
           * 2.- Regresa a la pantalla para borrar servicios
           */
          servicios.remove(TipoServicio);
          Navigator.pushNamed(context, BorrarServicioPage.id);
        },
      ).show();
    },
  );
}

class _DropDown extends StatefulWidget {
  String text; // Texto del DropDown
  //Variable iterable de strings que obtendra los servicios de la BD
  Iterable<String> items = [''];

// Constructor de la clase del Drop down
  _DropDown({required this.text, required this.items});

  @override
  State<StatefulWidget> createState() => _DropDownState();
}

class _DropDownState extends State<_DropDown> {
  /**
   * Variable que obtendra el valor seleccionado en el Drop Down
   */
  String? _value;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xff171717),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade500),
      ),
      child: SizedBox(
        width: sizeScreen.width * .72,
        height: sizeScreen.height * .058,
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
              isExpanded: true,
              hint: Text(
                widget.text,
                style: TextStyle(color: Colors.grey.shade600),
              ),
              value: _value, // Valor inicial del Drop Down
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              items: widget.items.map((String servicioss) {
                return DropdownMenuItem(
                  value: servicioss,
                  child: Text(servicioss),
                );
              }).toList(), // Se listan los servicios que se le mandan al Drop Down
              onChanged: 
              /**
               * Al cambiar el valor en el Drop Down sucede lo siguiente:
               * 1.- Se obtiene el servicio seleccionado.
               * 2.- Se le pasa a la variable local para mostrarlo despues.
               * 3.- Se manda el servicio seleccionado a la variable global de la BD para su posterior uso
               */
              (String? newValue) => setState(() {
                    _value = newValue!;
                    TipoServicio = _value!;
                  })),
        ),
      ),
    );
  }
}
