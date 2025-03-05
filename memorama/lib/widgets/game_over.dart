import 'package:flutter/material.dart';
import 'package:memorama/config/config.dart';
import 'package:memorama/app/home.dart';
import 'tablero.dart';

class GameOver{
  static void mostrar(BuildContext context, String message, Nivel nivel){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          title: const Text(
            "GAME OVER",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "outfit thin",
              fontStyle: FontStyle.italic,
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Colors.red
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                style: const TextStyle(
                  fontFamily: "outfit regular",
                  fontSize: 20,
                  color: Colors.red
                )
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context)=>const Home()),
                          (Route<dynamic> route) =>false
                      );
                    },
                    child: Text(
                      "Menú",
                      style: const TextStyle(
                        fontFamily: "outfit regular",
                        fontSize: 16
                      )
                    )
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Tablero(nivel)),
                      );
                    },
                    child: Text(
                      "Reiniciar",
                      style: const TextStyle(
                        fontFamily: "outfit regular",
                        fontSize: 16
                      )
                    )
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }
  static String _formatoTiempo(int segundos) {
    int minutos = segundos ~/ 60;
    int seg = segundos % 60;
    return "$minutos:${seg.toString().padLeft(2, '0')}";
  }
}
