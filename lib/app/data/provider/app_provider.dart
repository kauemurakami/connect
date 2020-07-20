import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'https://deze6.com.br/apiConnect';

class ApiClient {

final http.Client httpClient;
ApiClient({@required this.httpClient});

  cadastro(user) async {
    try {
      var response = await httpClient.post(baseUrl, headers: {"Content-Type":"application/json"}, body: jsonEncode(user));
      if (response.statusCode == 200) {
        print('cadastrado');
        return 'cadastrado com sucesso';
      } else
        print('erro ao adicionar usuário');
    } finally { }
  }

  login(){

  }

  getCategorias(){

  }


}