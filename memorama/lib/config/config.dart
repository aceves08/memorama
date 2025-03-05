library config.globals;

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:memorama/utilis/detalles.dart';

import '../widgets/tablero.dart';

enum Nivel {facil, medio, dificil, imposible}

List<String> cards (){
  return [
    "images/cloud.png",
    "images/cloud.png",
    "images/day.png",
    "images/day.png",
    "images/dino.png",
    "images/dino.png",
    "images/fish.png",
    "images/fish.png",
    "images/frog.png",
    "images/frog.png",
    "images/girraf.png",
    "images/girraf.png",
    "images/moon.png",
    "images/moon.png",
    "images/night.png",
    "images/night.png",
    "images/octo.png",
    "images/octo.png",
    "images/peacock.png",
    "images/peacock.png",
    "images/rabbit.png",
    "images/rabbit.png",
    "images/rain.png",
    "images/rain.png",
    "images/rainbow.png",
    "images/rainbow.png",
    "images/seahorse.png",
    "images/seahorse.png",
    "images/shark.png",
    "images/shark.png",
    "images/star.png",
    "images/star.png",
    "images/sun.png",
    "images/sun.png",
    "images/whale.png",
    "images/whale.png",
    "images/wolf.png",
    "images/wolf.png",
    "images/zoo.png",
    "images/zoo.png"
  ];
}

List<Detalles> inicio = [
  Detalles("Facil",
    Colors.green,
    Colors.green[200],
    const Tablero(Nivel.facil),),
  Detalles("Medio",
    Colors.yellow,
    Colors.yellow[200],
    const Tablero(Nivel.medio),),
  Detalles("Dificil",
    Colors.orange,
    Colors.orange[200],
    const Tablero(Nivel.dificil),),
  Detalles("Imposible",
    Colors.red,
    Colors.red[200],
    const Tablero(Nivel.imposible),)
];

List <String> baraja=[];
List <FlipCardController> controles=[];
List <bool> estados = [];
void barajar(Nivel nivel){
  int size =0;

  switch(nivel){
    case Nivel.imposible:
      size=40;
      break;
    case Nivel.dificil:
      size=30;
      break;
    case Nivel.medio:
      size=24;
      break;
    case Nivel.facil:
      size=16;
      break;
  }
  for(int i=0;i<size;i++){
    controles.add(FlipCardController());
    estados.add(true);
  }
  baraja = cards().sublist(0,size);
  baraja.shuffle();
}

int movimientos = 0;
int paresEncontrados = 0;
int totalPares = 0;
int tiempo = 0;

void iniciarInfo(Nivel nivel) {
  movimientos = 0;
  paresEncontrados = 0;
  totalPares = (nivel == Nivel.facil)
      ? 8
      : (nivel == Nivel.medio)
      ? 12
      : (nivel == Nivel.dificil)
      ? 15
      : 20;
}

Map<Nivel, int> limitTiempo ={
  Nivel.facil: 90,
  Nivel.medio: 120,
  Nivel.dificil: 180,
  Nivel.imposible: 210,
};

Map<Nivel, int> limitMovimientos = {
  Nivel.facil: 25,
  Nivel.medio: 35,
  Nivel.dificil: 45,
  Nivel.imposible: 60,
};

int ganados = 0;
int perdidos = 0;