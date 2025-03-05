import 'package:flutter/material.dart';

import '../config/config.dart';

class Botonera extends StatefulWidget {
  const Botonera({Key? key}) : super(key: key);

  @override
  _BotoneraState createState() => _BotoneraState();
}

class _BotoneraState extends State<Botonera> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: inicio.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: inicio[index].secondary!,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            blurRadius: 8,
                            color: Colors.black45,
                            offset: Offset(3, 4)
                        )
                      ]
                    ),
                    child: Center(
                      child: Text(inicio[index].name!,
                        style: TextStyle(
                            color: inicio[index].primary,
                            fontFamily: "outfit thin",
                            fontStyle: FontStyle.italic,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                  color: inicio[index].secondary!,
                                  offset: Offset(1, 1)
                              ),
                              Shadow(
                                  color: Colors.black26,
                                  offset: Offset(1, 1)
                              ),
                            ]
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => inicio[index].goto!));
            }
          );
        },
      ),
    );
  }
}
