import 'dart:async';
import 'package:flutter/material.dart';
import 'package:memorama/config/config.dart';
import 'package:memorama/widgets/confirmacion.dart';
import '../utilis/acciones.dart';
import 'game_over.dart';
import 'final.dart';

class Informacion extends StatefulWidget implements PreferredSizeWidget{
  final Nivel? nivel;
  const Informacion(this.nivel,{Key? key}) : super(key: key);

  @override
  _InformacionState createState() => _InformacionState();

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _InformacionState extends State<Informacion> {
  late Timer _timer;
  int _tiempo = 0;


  @override
  void initState(){
    _timer = Timer.periodic(const Duration(seconds: 1),(timer){
      setState(() {
        _tiempo++;
        tiempo = _tiempo;
        if (paresEncontrados == totalPares) {
          _timer.cancel();
          Final.mostrar(context, tiempo, movimientos, widget.nivel!);
          ganados++;
        }else{
          if(_tiempo>=limitTiempo[widget.nivel]!){
            _timer.cancel();
            GameOver.mostrar(context, "Se termino el tiempo", widget.nivel!);
            perdidos++;
          }
          if(movimientos>=limitMovimientos[widget.nivel]!){
            _timer.cancel();
            GameOver.mostrar(context, "Se terminaron los movimientos", widget.nivel!);
            perdidos++;
          }
        }
      });
    });
  }

  @override
  void dispose(){
    _timer.cancel();
    super.dispose();
  }

  String _formatoTiempo(int segundos){
    int minutos = segundos ~/60;
    int seg = segundos %60;
    return"$minutos:${seg.toString().padLeft(2,'0')}";
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: Text(
              "Mov: $movimientos",
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontFamily: "outfit regular",
                fontSize: 16,
                color: Colors.black
              )
            )
          ),
          Expanded(
            child: Text(
              "$paresEncontrados de $totalPares pares",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "outfit regular",
                fontSize: 16,
                color: Colors.black
              )
            )
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                const Icon(
                  Icons.timer,
                  color: Colors.black,
                  size: 20),
                const SizedBox(width: 5),
                Text(
                  _formatoTiempo(_tiempo),
                  style: const TextStyle(
                    fontFamily: "outfit regular",
                    fontSize: 16,
                    color: Colors.black
                  )
                )
              ]
            )
          )
        ],
      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: (String value){
            Confirmacion.mostrar(context, value, (){
              Acciones.ejecutar(context, value, widget.nivel!);
            });
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(
              value: "reiniciar",
              child: Text(
                "Reiniciar",
                  style: const TextStyle(
                    fontFamily: "outfit regular",
                    color: Colors.black
                  )
              )
            ),
            const PopupMenuItem(
              value: "salir",
              child: Text(
                "Salir",
                  style: const TextStyle(
                    fontFamily: "outfit regular",
                    color: Colors.black
                  )
              )
            ),
            const PopupMenuItem(
              value: "consultar",
              child: Text(
                "Consultar",
                  style: const TextStyle(
                    fontFamily: "outfit regular",
                    color: Colors.black
                  )
              )
            ),
            const PopupMenuItem(
              value: "nuevo",
              child: Text(
                "Nuevo Juego",
                  style: const TextStyle(
                    fontFamily: "outfit regular",
                    color: Colors.black
                  )
              )
            )
          ],
        )
      ],
    );
  }
}
