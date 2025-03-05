class Partida {
  int? id;
  String fecha;
  int ganadas;
  int perdidas;
  int movimientos;
  int tiempo;
  List<String> cartas;

  Partida({
    this.id,
    required this.fecha,
    required this.ganadas,
    required this.perdidas,
    required this.movimientos,
    required this.tiempo,
    required this.cartas,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fecha': fecha,
      'ganadas': ganadas,
      'perdidas': perdidas,
      'movimientos': movimientos,
      'tiempo': tiempo,
      'cartas': cartas.join(','),
    };
  }

  factory Partida.fromMap(Map<String, dynamic> map) {
    return Partida(
      id: map['id'],
      fecha: map['fecha'],
      ganadas: map['ganadas'],
      perdidas: map['perdidas'],
      movimientos: map['movimientos'],
      tiempo: map['tiempo'],
      cartas: map['cartas'].split(','),
    );
  }
}