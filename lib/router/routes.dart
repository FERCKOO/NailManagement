import 'package:angy/Screens/Ventas.dart';
import 'package:angy/Screens/agenda.dart';
import 'package:angy/Screens/borrarServicio.dart';
import 'package:angy/Screens/ganancias.dart';
import 'package:angy/Screens/lista_compras.dart';
import 'package:angy/Screens/logIn.dart';
import 'package:angy/Screens/logup.dart';
import 'package:angy/Screens/nuevaCita.dart';
import 'package:angy/Screens/nuevaVenta.dart';
import 'package:angy/Screens/nuevoMaterial.dart';
import 'package:angy/Screens/nuevoServicio.dart';
import 'package:angy/Screens/principal.dart';
import 'package:angy/Screens/servicios.dart';
import 'package:flutter/widgets.dart';

var customRoutes = <String, WidgetBuilder>{
  LogInPage.id: (_) => LogInPage(),
  LogUpPage.id: (_) => LogUpPage(),
  PrincipalPage.id: (_) => PrincipalPage(),
  AgendaPage.id: (_) => AgendaPage(),
  NuevaCitaPage.id: (_) => NuevaCitaPage(),
  VentasPage.id: (_) => VentasPage(),
  NuevaVentaPage.id: (_) => NuevaVentaPage(),
  ServiciosPage.id: (_) => ServiciosPage(),
  NuevoServicioPage.id: (_) => NuevoServicioPage(),
  BorrarServicioPage.id: (_) => BorrarServicioPage(),
  ListaDeComprasPage.id: (_) => ListaDeComprasPage(),
  NuevoMaterialPage.id: (_) => NuevoMaterialPage(),
  GananciasPage.id: (_) => GananciasPage()
};