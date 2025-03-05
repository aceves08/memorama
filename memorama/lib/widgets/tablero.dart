import 'package:flutter/material.dart';
import '../config/config.dart';
import '../widgets/parrilla.dart';
import '../widgets/informacion.dart';

class Tablero extends StatefulWidget {
  final Nivel? nivel;
  const Tablero(this.nivel, {Key? key}) : super(key: key);

  @override
  _TableroState createState() => _TableroState();
}

class _TableroState extends State<Tablero> {
  @override
  void initState() {
    super.initState();
    iniciarInfo(widget.nivel!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Informacion(widget.nivel!), // Usa el nuevo AppBar
      body: Parrilla(widget.nivel!),
    );
  }
}
