import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:angy/router/routes.dart';

import 'logup.dart';
import 'principal.dart';

class LogInPage extends StatefulWidget {
  static String id = 'LogIn_page';

  void setState(Null Function() param0) {}

  @override
  State<StatefulWidget> createState() => LogInPageState();
}

class LogInPageState extends State<LogInPage> {
  final email = TextEditingController(); // Variable para el email
  final pass = TextEditingController(); // Variable para la contraseña

  String? emailAux;
  String? passAux;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        /*
         * Texto de inicio sesion
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
             * Imagen del la app.
            
            Image(
                alignment: Alignment.topCenter,
                image: const AssetImage(
                  'assets/images/LogoPng.png',
                ),
                width: sizeScreen.width * .4),
            SizedBox(height: sizeScreen.height * .03),
            */

            /**
             * Texto de bienvenida
            Container(
              margin: EdgeInsetsDirectional.only(
                  top: sizeScreen.height * .03, bottom: sizeScreen.width * .03),
              child: const Text(
                'Bienvenid@',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            */

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

class _FutureBuilderGeneral extends StatefulWidget {
  final Future<dynamic> future;
  late String? data;

  _FutureBuilderGeneral({required this.future, required this.data});

  @override
  State<_FutureBuilderGeneral> createState() => _FutureBuilderGeneralState();
}

class _FutureBuilderGeneralState extends State<_FutureBuilderGeneral> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          widget.data = snapshot.data as String?;
          print('Esto hay en widget.data: ${widget.data}');

          return Text('Todo bien con la contraseña ${snapshot.data}');
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text('Error');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
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
      _emailVar = email.text; // Se recupera el texto digitado
      _passVar = pass.text; // Se recupera la contraseña registrada

      // Limpieza de los controladores
      @override
      void dispose() {
        email.dispose();
        pass.dispose();
      }
      Navigator.of(context).pushNamedAndRemoveUntil(
                PrincipalPage.id,
                (Route<dynamic> route) => false);
/*
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
                 if (users[_emailVar] == _passVar || referees[_emailVar] == _passVar)
                    { // Si el correo es de arbitro...
                    if (referees.containsKey(_emailVar))
                        { //Ingresa como arbitro print('Arbitro')
                        correoo = _emailVar;

                        Navigator.of(context).pushNamedAndRemoveUntil(
                            LayoutBottomNavigatorBarReferee.id,
                            (Route<dynamic> route) => false);
                        }else { //Ingresa como usuario comun print(users['Usuario])
                        correoo = _emailVar;
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            LayoutBottomNavigatorBarUser.id,
                            (Route<dynamic> route) => false);
                        }
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
  Color coloor = Colors.grey.shade600;
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
        controller: widget.myControler,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
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
