// ignore_for_file: file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class GananciasPage extends StatelessWidget {
  static String id = 'Ganancias_Page';

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
              Navigator.pop(context);
            },
          ),
          /*
         * Texto de inicio sesion
        */
          title: const Text(
            'Ganancias',
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
          mainAxisSize: MainAxisSize.min,
          children: [

            /**
             * Linea horizontal.
            */
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE51E3F),
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: sizeScreen.height * .002),

            //Zona de Ligas
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    child: Card(
                      elevation: 7,
                      shadowColor: Color(0xFFE51E3F),
                      child: ListTile(
                        title: Text('aaaa'),
                      ),
                    ),
                    onTap: () {
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
