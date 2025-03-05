import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import '../config/config.dart';

class Parrilla extends StatefulWidget {
  final Nivel? nivel;
  const Parrilla(this.nivel, {Key? key}) : super(key: key);

  @override
  _ParrillaState createState() => _ParrillaState();
}

class _ParrillaState extends State<Parrilla> {
  int? prevclicked;
  bool? flag, habilitado, mostrar;

  @override
  void initState() {
    super.initState();
    controles = [];
    baraja = [];
    estados = [];
    barajar(widget.nivel!);
    prevclicked = -1;
    flag = false;
    habilitado = false;

    for (var i = 0; i < baraja.length; i++) {
      estados.add(false);
      controles.add(FlipCardController());
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var i = 0; i < controles.length; i++) {
        controles[i].toggleCard();
      }

      Future.delayed(const Duration(seconds: 3), () {
        for (var i = 0; i < controles.length; i++) {
          controles[i].toggleCard();
          estados[i] = true;
        }

        setState(() {
          habilitado = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: baraja.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (context, index) {
        return FlipCard(
          onFlip: () {
            if (!habilitado!) return;
            if (!flag!) {
              prevclicked = index;
              estados[index] = false;
            } else {
              setState(() {
                habilitado = false;
              });
            }
            flag = !flag!;
            estados[index] = false;

            if (prevclicked != index && !flag!) {
              if (baraja.elementAt(index) == baraja.elementAt(prevclicked!)) {
                setState(() {
                  habilitado = true;
                  paresEncontrados++;
                });
              } else {
                Future.delayed(const Duration(seconds: 1), () {
                  controles.elementAt(prevclicked!).toggleCard();
                  estados[prevclicked!] = true;
                  prevclicked = index;
                  controles.elementAt(index).toggleCard();
                  estados[index] = true;
                  setState(() {
                    habilitado = true;
                  });
                });
              }
              setState(() {
                movimientos++;
              });
            } else {
              setState(() {
                habilitado = true;
              });
            }
          },
          fill: Fill.fillBack,
          controller: controles[index],
          flipOnTouch: habilitado! ? estados.elementAt(index) : false,
          front: Image.asset("images/reverso.jpeg"),
          back: Image.asset(baraja[index]),
        );
      },
    );
  }
}
