// ignore_for_file: file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:angy/Api/bd_agenda.dart';
import 'package:angy/Api/bd_servicios.dart';
import 'package:angy/Api/bd_ventas.dart';
import 'package:angy/Screens/servicios.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class BorrarServicioPage extends StatefulWidget {
  static String id = 'BorrarServicio_Page';
  
  @override
  State<StatefulWidget> createState() => BorrarServicioPageState();
}
class BorrarServicioPageState extends State<BorrarServicioPage>{

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
              Navigator.pushNamedAndRemoveUntil(context, ServiciosPage.id, (route) => false);
            },
          ),
          /*
         * Texto de inicio sesion
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
            _DropDown(
              text: '   Servicio',
              items: servicios.keys,
            ),
            SizedBox(height: sizeScreen.height * .03),
            _buttonSingUp(context, sizeScreen)
          ],
        ),
      ),
    );
  }
}

/*
 * Seccion de metodos y funciones
*/

Widget _buttonSingUp(BuildContext context, Size size) {

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.red,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .1,
        vertical: size.height * .029,
      ),
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
          AwesomeDialog(
          dialogType: DialogType.noHeader,
          context: context,
          // ignore: deprecated_member_use
          animType: AnimType.SCALE,
          title: 'sin registro',
          body: const Center(
            child: Text(
              '¿Estas seguro que quieres borrar este servicio?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato'),
            ),
          ),
          btnOkColor: Colors.grey.shade600,
          btnOkText: 'Borrar',
          btnOkOnPress: () {
            servicios.remove(TipoServicio);
            print(servicios);
            Navigator.pushNamed(context, BorrarServicioPage.id);
          },
        ).show();
    },
  );
}

class _DropDown extends StatefulWidget {
  String text;
  Iterable<String> items = [''];

  _DropDown({required this.text, required this.items});

  @override
  State<StatefulWidget> createState() => _DropDownState();
}

class _DropDownState extends State<_DropDown> {
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
              value: _value,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              items: widget.items.map((String posiciones) {
                return DropdownMenuItem(
                  value: posiciones,
                  child: Text(posiciones),
                );
              }).toList(),
              onChanged: (String? newValue) => setState(() {
                    _value = newValue!;
                    TipoServicio = _value!;
                  })),
        ),
      ),
    );
  }
}