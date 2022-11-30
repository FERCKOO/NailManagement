// ignore_for_file: file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:angy/Api/bd_agenda.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

import '../Api/bd_servicios.dart';
import 'agenda.dart';

class NuevaCitaPage extends StatelessWidget {
  static String id = 'NuevaCita_Page';

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    final firstName = TextEditingController();

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
            'Nueva cita',
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
            _textFieldName(sizeScreen, firstName),
            SizedBox(height: sizeScreen.height * .02),
            _DropDown(
              text: '   Servicio',
              items: servicios.keys,
            ),
            SizedBox(height: sizeScreen.height * .02),
            _formFieldDate(),
            SizedBox(height: sizeScreen.height * .03),
            _buttonSingUp(context, sizeScreen, firstName)
          ],
        ),
      ),
    );
  }
}

/*
 * Seccion de metodos y funciones
*/
Widget _formFieldDate() {
  return _formDateGeneral();
}

Widget _textFieldName(Size size, fName) {
  return _textFieldGeneral(
    labelText: 'Nombre',
    icon: Icons.person_outline,
    hintText: 'Nombre',
    sizeScreen: size,
    myControler: fName,
  );
}

Widget _buttonSingUp(BuildContext context, Size size, fName) {
  String _fNameVar = '';
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
      'Agendar cita',
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {

      _fNameVar = fName.text;
      // Limpieza de los controladores
      @override
      void dispose() {
        fName.dispose();
      }

      if (_fNameVar != '' 
      && TipoServicio != '' 
      && fechaCita != '' 
      && horaCita != ''){
        servicio.addAll({servicio.keys.last+1: TipoServicio});
        cliente.addAll({cliente.keys.last+1: _fNameVar});
        fechaHoraCita.addAll({fechaHoraCita.keys.last+1: '$fechaCita $horaCita'});
        print(servicio);
        print(cliente);
        print(fechaHoraCita);

        Navigator.of(context).pushNamedAndRemoveUntil(AgendaPage.id, (route) => false);

      } else {
        AwesomeDialog(
          dialogType: DialogType.noHeader,
          context: context,
          // ignore: deprecated_member_use
          animType: AnimType.SCALE,
          title: 'Campos',
          body: const Center(
            child: Text(
              'Llene todos los campos para agendar una cita.',
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

// clase fecha de cita
class _formDateGeneral extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff171717),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: sizeScreen.width * .15,
      ),
      child: Form(
        child: Column(
          children: <Widget>[
            DateTimeFormField(
              firstDate: DateTime.now(),
              dateTextStyle: TextStyle(color: Colors.grey.shade600),
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  suffixIcon:
                      Icon(Icons.event_note, color: Colors.grey.shade600),
                  labelText: 'Fecha y hora de cita',
                  labelStyle: TextStyle(color: Colors.grey.shade600)),
              validator: (DateTime? e) =>
                  (e?.day ?? 0) == 1 ? 'No seleccione el primer dia' : null,
              onDateSelected: (DateTime value) {
                // Separar fecha de hora
                fechaCita = '${value.day}/${value.month}/${value.year}';
                horaCita = '${value.hour}:${value.minute}';
              },
            ),
          ],
        ),
      ),
    );
  }
}
