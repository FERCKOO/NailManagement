// ignore_for_file: file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:angy/Api/bd_listaCompras.dart';
import 'package:angy/Screens/lista_compras.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class NuevoMaterialPage extends StatelessWidget {
  static String id = 'NuevoMaterial_Page';

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    final name = TextEditingController();

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
            'Nuevo material',
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
            _textFieldName(sizeScreen, name),
            SizedBox(height: sizeScreen.height * .03),
            _buttonSingUp(context, sizeScreen, name)
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
    labelText: 'Material',
    icon: Icons.person_outline,
    hintText: 'Material',
    sizeScreen: size,
    myControler: name,
  );
}

Widget _buttonSingUp(BuildContext context, Size size, name) {
  String _NameVar = '';
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

      // Limpieza de los controladores
      @override
      void dispose() {
        name.dispose();
      }

      if (_NameVar != '') {
          listAComprar.add(_NameVar);
          Navigator.pushNamedAndRemoveUntil(context, ListaDeComprasPage.id, (route) => false);
      } else {
        AwesomeDialog(
          dialogType: DialogType.noHeader,
          context: context,
          // ignore: deprecated_member_use
          animType: AnimType.SCALE,
          title: 'Campos',
          body: const Center(
            child: Text(
              'Llene el campo necesario',
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