// ignore_for_file: file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:angy/Api/bd_agenda.dart';
import 'package:angy/Api/bd_servicios.dart';
import 'package:angy/Screens/servicios.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class NuevoServicioPage extends StatelessWidget {
  static String id = 'NuevoServicio_Page'; //Variable que obtendra la ruta de la pantalla

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    final name = TextEditingController();  // Variable para obtener el nombre del nuevo servicio
    final costo = TextEditingController(); // Variable para obtener el costo del servicio

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
              // Regreso a la pantalla principal
              Navigator.pushNamedAndRemoveUntil(
                  context, ServiciosPage.id, (route) => false);
            },
          ),
          /*
         * Texto de inicio sesion
        */
          title: const Text(
            'Nuevo servicio',
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
             * Seccion del formulario
             */
            _textFieldName(sizeScreen, name),
            SizedBox(height: sizeScreen.height * .02),
            _textFieldCost(sizeScreen, costo),
            SizedBox(height: sizeScreen.height * .03),
            _buttonNuevoServicio(context, sizeScreen, name, costo)
          ],
        ),
      ),
    );
  }
}

/*
 * Seccion de metodos y funciones
*/

Widget _textFieldName(Size size, name) {
  return _textFieldGeneral(
    labelText: 'Servicio',
    icon: Icons.person_outline,
    hintText: 'Servicio',
    sizeScreen: size,
    myControler: name,
  );
}

Widget _textFieldCost(Size size, costo) {
  return _textFieldGeneral(
    labelText: 'Costo',
    icon: Icons.person_outline,
    hintText: '\$\$',
    sizeScreen: size,
    myControler: costo,
  );
}

Widget _buttonNuevoServicio(BuildContext context, Size size, name, costo) {
  String _NameVar = ''; // Variable local auxiliar para el nombre del nuevo servico
  String _costoVar = ''; // Variable local auxiliar para el costo del servicio
  Color coloor = Colors.grey.shade700;

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: coloor,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .1,
        vertical: size.height * .029,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: const Text(
      'Guardar',
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      _NameVar = name.text;
      _costoVar = costo.text;

      // Limpieza de los controladores
      @override
      void dispose() {
        name.dispose();
        costo.dispose();
      }

      // Verificaicon para que no esten vacios los labels
      if (_NameVar != '' && _costoVar != '') {
        // Si el servicio digitado ya eiste...
        if (servicio.containsValue(TipoServicio)) {
          AwesomeDialog(
            dialogType: DialogType.noHeader,
            context: context,
            // ignore: deprecated_member_use
            animType: AnimType.SCALE,
            title: 'sin registro',
            body: const Center(
              child: Text(
                'Este servicio ya existe.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato'),
              ),
            ),
            btnOkColor: coloor,
            btnOkText: 'Ok',
            btnOkOnPress: () {},
          ).show();
        } else {
          /**
           * Si el servicio a agregar no exist hace lo siguiente:
           * 1.- Agrega el servicio y costo digitados a la BD local
           * 2.- Lo redirecciona a la pantalla de los servicios
           */
          servicios.addAll({_NameVar: int.parse(_costoVar)});
          Navigator.pushNamed(context, ServiciosPage.id);
        }
      } else {
        AwesomeDialog(
          dialogType: DialogType.noHeader,
          context: context,
          // ignore: deprecated_member_use
          animType: AnimType.SCALE,
          title: 'Campos',
          body: const Center(
            child: Text(
              'Llene todos los campos para registrar el nuevo servicio.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato'),
            ),
          ),
          btnOkColor: coloor,
          btnOkText: 'Ok',
          btnOkOnPress: () {},
        ).show();
      }
    },
  );
}

/**
 * Clase generica de text labels
 */
class _textFieldGeneral extends StatefulWidget {
  final String labelText; //Texto del label
  final String? hintText; //Texto de muestra
  final TextInputType? keyboardType;
  final IconData icon;
  final bool obscureText;
  final TextEditingController myControler;
  final Size sizeScreen;

  const _textFieldGeneral({
    required this.labelText,
    this.hintText,
    this.keyboardType,
    required this.icon,
    this.obscureText = false,
    required this.sizeScreen,
    required this.myControler,
  });

  @override
  State<_textFieldGeneral> createState() => _textFieldGeneralState();
}

class _textFieldGeneralState extends State<_textFieldGeneral> {
  Color coloor = Colors.grey.shade600;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff171717),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: widget.sizeScreen.width * .15,
      ),
      child: TextField(
        style: TextStyle(color: coloor),
        controller: widget.myControler,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: coloor),
          labelStyle: TextStyle(color: coloor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          suffixIcon: Icon(widget.icon, color: coloor),
          labelText: widget.labelText,
          hintText: widget.hintText,
        ),
        onChanged: (value) {},
      ),
    );
  }
}