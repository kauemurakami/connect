import 'dart:convert';
import 'package:connect/app/data/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'https://deze6.com.br/apiConnect';

class ApiClient {

final http.Client httpClient;
ApiClient({@required this.httpClient});

  cadastro(user) async {
    print(user);
    try {
      var response = await httpClient.post(baseUrl, headers: {"Content-Type":"application/json"}, body: jsonEncode(user));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        UserModel userCad = jsonResponse['cadastro'].map<UserModel>((map){
          return UserModel.fromJson(map);
        });
        print(userCad);
        return userCad;
      } else
        print('erro ao adicionar usuário');
    } finally { }
  }
  login(){

  }
  getCategorias(){

  }


}