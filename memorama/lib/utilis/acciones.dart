import 'package:flutter/material.dart';
import '../app/home.dart';
import '../config/config.dart';
import '../widgets/tablero.dart';
import '../utilis//db.dart';
import 'package:intl/intl.dart';

class Acciones {
  static void ejecutar(BuildContext context, String opcion, Nivel nivel) {
    switch (opcion) {
      case "reiniciar":
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Tablero(nivel)),
        );
        break;

      case "salir":
        String fecha = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

        DBHelper.guardarPartida(
          fecha,
          ganados,
          perdidos,
          movimientos,
          tiempo,
          baraja.map((carta) => carta.toString()).toList(),
        ).then((_) {
          ganados = 0;
          perdidos = 0;
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Home()),
                (Route<dynamic> route) => false,
          );
        });
        break;

      case "consultar":
        DBHelper.obtenerPartidas().then((partidas) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Historial de Partidas"),
                content: SizedBox(
                  width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: partidas.length,
                    itemBuilder: (context, index) {
                      var partida = partidas[index];
                      return ListTile(
                        title: Text("Fecha: ${partida['fecha']}"),
                        subtitle: Text(
                          "Ganadas: ${partida['ganadas']} | Perdidas: ${partida['perdidas']}\n"
                              "Movimientos: ${partida['movimientos']} | Tiempo: ${partida['tiempo']} seg",
                        ),
                      );
                    },
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Cerrar"),
                  ),
                ],
              );
            },
          );
        });

        break;

      case "nuevo":
        Navigator.of(context).pop();
        perdidos++;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Tablero(nivel)),
        );
        break;
    }
  }
}
