class Continente {
  late String nombre;
  String? imagen;

  Continente({required this.nombre, this.imagen});

  Continente.fromJSON(Map<String, dynamic> objetoJSON) {
    nombre = objetoJSON["nombre"] ?? "";
    imagen = objetoJSON["imagen"] ?? "";
  }
}
