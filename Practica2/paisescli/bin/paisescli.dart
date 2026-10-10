import 'dart:io';

import 'package:paisescli/data/repositories/paises_repository.dart';

final repository = PaisesRepository();

void main(List<String> argumentos) async {
  if (argumentos.isEmpty) {
    print(
      '\x1B[31mDebes especificar una orden (continentes, paises, infopais)\x1B[0m',
    );
    exit(-1);
  }

  List<String> listaArgs = List.from(argumentos);
  String orden = listaArgs[0];
  listaArgs.removeAt(0);
  String args = listaArgs.join(" ");

  switch (orden) {
    case "continentes":
      await muestraContinentes();
      break;
    case "paises":
      if (argumentos.length < 2) {
        print(
          "\x1B[31mNúmero de argumentos incorrecto. Hay que especificar el continente.\x1B[0m",
        );
        exit(-1);
      }
      await muestraPaises(args);
      break;
    case "infopais":
      if (argumentos.length < 2) {
        print(
          "\x1B[31mNúmero de argumentos incorrecto. Hay que especificar el país.\x1B[0m",
        );
        exit(-1);
      }
      await muestraInfoPais(args);
      break;
    default:
      print("\x1B[31mOrden desconocida\x1B[0m");
  }
}

Future<void> muestraContinentes() async {
  try {
    var continentes = await repository.getContinentes();
    for (var c in continentes) {
      print('\x1B[32m${c.nombre}\x1B[0m - ${c.imagen ?? "Sin imagen"}');
    }
  } catch (e) {
    print('\x1B[31mError: $e\x1B[0m');
  }
}

Future<void> muestraPaises(String continente) async {
  try {
    var paises = await repository.getPaises(continente);
    for (var p in paises) {
      print('\x1B[32m${p.nombre}\x1B[0m - ${p.imagen ?? "Sin imagen"}');
    }
  } catch (e) {
    print('\x1B[31mError: $e\x1B[0m');
  }
}

Future<void> muestraInfoPais(String pais) async {
  try {
    var paisObj = await repository.infoPais(pais);
    print(paisObj); // Utiliza el toString() formateado de la clase Pais
  } catch (e) {
    print('\x1B[31mError: $e\x1B[0m');
  }
}
