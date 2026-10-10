import 'dart:convert';

import 'package:http/http.dart' as http;

class PaisesApi {
  String urlBase = 'https://api-paises-uagm.onrender.com';

  Future<List<dynamic>> getContinentes() async {
    final response = await http.get(Uri.parse('$urlBase/continentes'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al cargar los continentes');
    }
  }

  Future<List<dynamic>> getPaises(String continente) async {
    final response = await http.get(Uri.parse('$urlBase/paises/$continente'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al cargar los países del continente $continente');
    }
  }

  Future<dynamic> infoPais(String pais) async {
    final response = await http.get(Uri.parse('$urlBase/infopais/$pais'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al cargar la información del país $pais');
    }
  }
}
