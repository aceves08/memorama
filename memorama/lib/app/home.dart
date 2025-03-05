import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:memorama/config/config.dart';

import '../widgets/botonera.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Memorama"),
        actions: <Widget>[
          IconButton(onPressed: (){
          if(Platform.isAndroid || Platform.isIOS){
            SystemNavigator.pop();
          }
          if (Platform.isWindows || Platform.isLinux){
            exit(0);
          }
        }, icon: Icon(Icons.exit_to_app))],
      ),
      body: const Botonera(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.check_circle, color: Colors.green),
            label: "Ganadas: $ganados",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.cancel, color: Colors.red),
            label: "Perdidas: $perdidos",
          ),
        ],
      )
    );
  }
}
