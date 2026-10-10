class Pais {
  late String nombre;
  String? capital;
  String? poblacion;
  String? imagen;
  String? descripcion;
  double? latitud;
  double? longitud;

  Pais({
    required this.nombre,
    this.capital,
    this.poblacion,
    this.imagen,
    this.descripcion,
    this.latitud,
    this.longitud,
  });

  Pais.fromJSON(Map<String, dynamic> json) {
    nombre = json['nombre'] ?? '';
    capital = json['capital'];
    poblacion = json['poblacion']?.toString();
    imagen = json['imagen'];
    descripcion = json['descripcion'];
    latitud = json['latitud'] != null
        ? (json['latitud'] as num).toDouble()
        : null;
    longitud = json['longitud'] != null
        ? (json['longitud'] as num).toDouble()
        : null;
  }

  @override
  String toString() {
    return '''
\x1B[34mPaís:\x1B[0m       $nombre
\x1B[34mCapital:\x1B[0m    ${capital ?? 'No disponible'}
\x1B[34mPoblación:\x1B[0m  ${poblacion ?? 'No disponible'}

\x1B[34mImagen:\x1B[0m     ${imagen ?? 'No disponible'}

\x1B[34mDescripción:\x1B[0m ${descripcion ?? 'No disponible'}

\x1B[34mCoordenadas:\x1B[0m (${latitud ?? 0.0}, ${longitud ?? 0.0})
''';
  }
}
