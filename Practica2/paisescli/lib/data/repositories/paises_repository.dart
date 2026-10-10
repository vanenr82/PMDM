import '../../domain/entities/continente.dart';
import '../../domain/entities/pais.dart';
import '../services/paises_api.dart';

class PaisesRepository {
  String urlBase = 'https://api-paises-uagm.onrender.com';
  late PaisesApi api;

  PaisesRepository() {
    api = PaisesApi();
  }

  Future<List<Continente>> getContinentes() async {
    List<dynamic> jsonList = await api.getContinentes();
    return jsonList.map((json) => Continente.fromJSON(json)).toList();
  }

  Future<List<Pais>> getPaises(String continente) async {
    List<dynamic> jsonList = await api.getPaises(continente);
    return jsonList.map((json) => Pais.fromJSON(json)).toList();
  }

  Future<Pais> infoPais(String pais) async {
    var json = await api.infoPais(pais);
    return Pais.fromJSON(json);
  }
}
