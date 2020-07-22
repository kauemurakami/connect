import 'dart:convert';
import 'package:connect/app/data/model/cidade_model.dart';
import 'package:connect/app/data/model/estado_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'https://servicodados.ibge.gov.br/api/v1/localidades';

class LocalidadesApiClient {
  final http.Client httpClient;
  LocalidadesApiClient({@required this.httpClient});

    getEstados() async {
    http.Response response = await httpClient.get('$baseUrl/estados');
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      List<dynamic> dadosJson = json.decode(response.body);
      List<Estado> estados = dadosJson.map<Estado>((map) {
        return Estado.fromJson(map);
      }).toList();
      print(estados);
      return estados;
    } else
      print('sem retorno');
  }

  getCidades(estado) async {
    http.Response response = await httpClient.get('$baseUrl/estados/${estado.sigla}/municipios');
    //print('$baseUrl/estados/+${estado.sigla}/municipios');
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      List<dynamic> dadosJson = json.decode(response.body);
      List<Cidade> cidades = dadosJson.map<Cidade>((map) {
        return Cidade.fromJson(map);
      }).toList();    
      return cidades;
    } else
      print('sem retorno');
  }

}
