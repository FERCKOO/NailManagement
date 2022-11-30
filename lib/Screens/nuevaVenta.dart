// ignore_for_file: file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:angy/Api/bd_agenda.dart';
import 'package:angy/Api/bd_servicios.dart';
import 'package:angy/Api/bd_ventas.dart';
import 'package:angy/Screens/ventas.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class NuevaVentaPage extends StatelessWidget {
  static String id = 'NuevaVenta_Page'; //Variable que obtendra la ruta de la pantalla

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    final firstName = TextEditingController(); // Variable para obtener el nombre
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
              Navigator.pop(context);
            },
          ),
          /*
         * Texto de inicio sesion
        */
          title: const Text(
            'Nueva venta',
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
             * Formulario para la venta nueva
             */
            _textFieldName(sizeScreen, firstName),
            SizedBox(height: sizeScreen.height * .02),
            _DropDown(
              text: '   Servicio',
              items: servicios.keys,
            ),
            SizedBox(height: sizeScreen.height * .02),
            _formFieldDate(),
            SizedBox(height: sizeScreen.height * .02),
            _textFieldCost(sizeScreen, costo),
            SizedBox(height: sizeScreen.height * .03),
            _buttonSingUp(context, sizeScreen, firstName, costo)
          ],
        ),
      ),
    );
  }
}

/*
 * Seccion de metodos, funciones y widgets propios
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

Widget _textFieldCost(Size size, costo) {
  return _textFieldGeneral(
    labelText: 'Costo',
    icon: Icons.person_outline,
    hintText: '\$\$',
    sizeScreen: size,
    myControler: costo,
  );
}

Widget _buttonSingUp(BuildContext context, Size size, fName, costo) {
  // Variables locales auxiliares
  String _fNameVar = ''; 
  String _costoVar = '';
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
      'Registrar venta',
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      _fNameVar = fName.text; // Se obtiene el nombre del text label
      _costoVar = costo.text; // Se obtiene el costo del text label

      // Limpieza de los controladores
      @override
      void dispose() {
        fName.dispose();
        costo.dispose();
      }

      // Se verifica que n esten vacios los text labels
      if (_fNameVar != '' &&
          TipoServicio != '' &&
          fechaCita != '' &&
          horaCita != '' &&
          _costoVar != '') {
            /**
             * Si los datos existen en la base de datos...
             * Esto quiere decir si se tiene la cita agendada
             * Se puede generar el reporte de la venta del servicio
             */
        if (cliente.values.contains(_fNameVar) &&
            servicio.containsValue(TipoServicio) &&
            fechaHoraCita.containsValue('$fechaCita $horaCita') &&
            costos.length == cliente.length) {
              /**
               * Si todo sale bien se procede a hacer lo siguiente:
               * 1.- Se agrega el costo del servicio a la bd.
               * 2.- Se redirecciona a la pagina de las ventas.
               */
          costos.addAll({costos.keys.last + 1: int.parse(_costoVar)});
          Navigator.pushNamedAndRemoveUntil(context, VentasPage.id, (route) => false);
        } else {
          AwesomeDialog(
            dialogType: DialogType.noHeader,
            context: context,
            // ignore: deprecated_member_use
            animType: AnimType.SCALE,
            title: 'sin registro',
            body: const Center(
              child: Text(
                'No tiene agendada esta cita.',
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
      } else {
        AwesomeDialog(
          dialogType: DialogType.noHeader,
          context: context,
          // ignore: deprecated_member_use
          animType: AnimType.SCALE,
          title: 'Campos',
          body: const Center(
            child: Text(
              'Llene todos los campos para registrar la venta.',
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
