import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:angy/router/routes.dart';

import 'logup.dart';
import 'principal.dart';

class LogInPage extends StatefulWidget {
  static String id = 'LogIn_page'; //Variable que obtendra la ruta de la pantalla

  void setState(Null Function() param0) {}

  @override
  State<StatefulWidget> createState() => LogInPageState();
}

class LogInPageState extends State<LogInPage> {
  final email = TextEditingController(); // Variable para obtener el email
  final pass = TextEditingController(); // Variable para obtener la contraseña

  String? emailAux; // Variable auxiliar para guardar el email
  String? passAux; // Variable auxiliar para guardar el email

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
        backgroundColor: Colors.black,
        /*
         * Texto del encabezado
        */
        title: const Text(
          'Bienvenido',
          textAlign: TextAlign.center,
          // ignore: unnecessary_const
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: sizeScreen.height * .03,
            ),

            /*
               * Seccion de formulario
              */

            SizedBox(height: sizeScreen.height * .01),
            _textFieldEmail(email),
            SizedBox(height: sizeScreen.height * .03),
            _textFieldPassword(pass),
            SizedBox(height: sizeScreen.height * .07),
            _buttonSingIn(context, email, pass, emailAux, passAux),
            SizedBox(height: sizeScreen.height * .08),

            /*
              * Seccion de actualizacion de contraseña
              * Implementacion a futuro
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "¿Olvidaste tu contraseña? ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    // Detecta alguna accion en texto
                    onTap: (() {
                      //Navigator.pushNamed(context, ForgotPassPage.id);
                    }),
                    child: const Text(
                      ' Da click aqui',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: sizeScreen.height * .01),
            */

            /*
              * Seccion para registrarse
            */
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "¿Aun no te registras? ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  /**
                   * Widget para detectar gestos en zonas de la pantalla
                   * Detectará la pulsacion del texto
                   */
                  GestureDetector(
                    onTap: (() {
                      Navigator.pushNamed(context, LogUpPage.id);
                    }),
                    child: const Text(
                      'Registrate',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

Widget _textFieldEmail(email) {
  return _textFieldGeneral(
    labelText: 'Correo',
    icon: Icons.email_outlined,
    hintText: 'example@hotmail.com',
    myControler: email,
    onChanged: () {},
  );
}

Widget _textFieldPassword(pass) {
  return _textFieldGeneral(
    labelText: 'Contraseña',
    icon: Icons.lock_outline_rounded,
    hintText: '*********',
    obscureText: true,
    myControler: pass,
    onChanged: () {},
  );
}

Widget _buttonSingIn(BuildContext context, email, pass, emailAux, passAux) {
  final sizeScreen = MediaQuery.of(context).size;

// Variables locales para guardar lo que se obtiene de los controladores
  String _emailVar = ''; 
  String _passVar = ''; 

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.grey.shade700,
      padding: EdgeInsets.symmetric(
        horizontal: sizeScreen.width * .18,
        vertical: sizeScreen.height * .029,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: const Text(
      'Iniciar sesion',
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      _emailVar = email.text; // Se recupera el texto digitado en el textLabel
      _passVar = pass.text; // Se recupera la contraseña registrada en el textLabel

      // Limpieza de los controladores
      @override
      void dispose() {
        email.dispose();
        pass.dispose();
      }

      // Navegacion hacia la pantalla principal de la app
      Navigator.of(context).pushNamedAndRemoveUntil(
          PrincipalPage.id, (Route<dynamic> route) => false);
      
      
      /*
       * Validaciones para el inicio de sesion
       * Comentadas por el momento para entrar directamente a la app
       
      //Si no estan vacios los TextField
      if (_emailVar != '' && _passVar != '') {
        /*

        // Si contiene una extenicion de correo electronico...
        if (_emailVar.contains('@hotmail.com') ||
                _emailVar.contains('@outlook.com') ||
                _emailVar.contains('@gmail.com'))
            {

            // Si existe el correo en el arreglo...
            if (users.containsKey(_emailVar) || referees.containsKey(_emailVar))
               { // Si contraseña es la misma en el arreglo...
                 if (users[_emailVar] == _passVar)
                    { 
                     //Ingresa como usuario
                        correoo = _emailVar;
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            PrincipalPage.id,
                            (Route<dynamic> route) => false);
                    
                    } else AwesomeDialog(
                        dialogType: DialogType.error,
                        context: context,
                        // ignore: deprecated_member_use
                        animType: AnimType.SCALE,
                        title: 'Contraseña',
                        body: const Center(
                          child: Text(
                            'Su contraseña es erronea.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato'),
                          ),
                        ),
                        btnOkColor: const Color(0xFF011C53),
                        btnOkText: 'Ok',
                        btnOkOnPress: () {},
                      ).show();
               } else AwesomeDialog(
                    dialogType: DialogType.noHeader,
                    context: context,
                    // ignore: deprecated_member_use
                    animType: AnimType.SCALE,
                    title: 'registro',
                    body: const Center(
                      child: Text(
                        'Usted no está registrado.\nSe le redireccionará a la pantalla de registro',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato'),
                      ),
                    ),
                    btnOkColor: const Color(0xFF011C53),
                    btnOkText: 'Ok',
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, LogUpPage.id);
                    },
                  ).show();
            } else AwesomeDialog(
                dialogType: DialogType.noHeader,
                context: context,
                // ignore: deprecated_member_use
                animType: AnimType.SCALE,
                title: 'Correo electronico',
                body: const Center(
                  child: Text(
                    'Verifique que su correo contenga alguna de las siguientes extenciones.\n@hotmail.com, @gmail.com ó @outlook.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato'),
                  ),
                ),
                btnOkColor: const Color(0xFF011C53),
                btnOkText: 'Ok',
                btnOkOnPress: () {},
              ).show();
              */
      } else {
        AwesomeDialog(
          dialogType: DialogType.noHeader,
          context: context,
          // ignore: deprecated_member_use
          animType: AnimType.SCALE,
          title: 'Campos',
          body: const Center(
            child: Text(
              'Llene todos los campos.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato'),
            ),
          ),
          btnOkColor: const Color(0xFF011C53),
          btnOkText: 'Ok',
          btnOkOnPress: () {},
        ).show();
      }
      */
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
  final Function onChanged;
  final bool obscureText;
  final TextEditingController myControler;

  /**
   * Constructor para los TextLabels
   */
  const _textFieldGeneral(
      {required this.labelText,
      this.hintText,
      this.keyboardType,
      required this.icon,
      required this.onChanged,
      this.obscureText = false,
      required this.myControler});

  @override
  State<_textFieldGeneral> createState() => _textFieldGeneralState();
}

class _textFieldGeneralState extends State<_textFieldGeneral> {
  Color coloor = Colors.grey.shade600; // Variable para ponerle color a lo necesario
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: TextField(
        style: TextStyle(color: coloor),
        controller: widget.myControler, // Controlador de cada text label
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText, // Ocultar la contraseña
        decoration: InputDecoration(
          hintStyle: TextStyle(color: coloor),
          labelStyle: TextStyle(color: coloor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          prefixIcon: Icon(widget.icon, color: coloor),
          labelText: widget.labelText,
          hintText: widget.hintText,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
