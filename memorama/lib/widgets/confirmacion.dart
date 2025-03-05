import 'package:flutter/material.dart';

class Confirmacion {
 static void mostrar(
   BuildContext context, String opcion, VoidCallback onConfirmar){
   showDialog(
     context: context,
     barrierDismissible: false,
     builder: (BuildContext context){
       return AlertDialog(
         shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15)
         ),
         title: Text(
           opcion,
           textAlign: TextAlign.center,
           style: TextStyle(
             fontFamily: "outfit thin",
             fontStyle: FontStyle.italic,
             fontSize: 45,
             fontWeight: FontWeight.bold
           ),
         ),
         content: Text(
           "¿Deseas continuar con la acción de \"$opcion\"?",
           textAlign: TextAlign.center,
           style: TextStyle(
             fontFamily: "outfit regular",
             fontStyle: FontStyle.italic,
             fontSize: 20
           )
         ),
         actions: [
           TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              "Cancelar",
              style: const TextStyle(
                fontFamily: "outfit regular",
                fontSize: 16
              )
            )
           ),
           TextButton(
             onPressed: () => Navigator.of(context).pop(),
             child: const Text(
               "Aceptar",
               style: const TextStyle(
                 fontFamily: "outfit regular",
                 fontSize: 16
               )
             )
           ),
         ],
       );
     }
   );
 }
}