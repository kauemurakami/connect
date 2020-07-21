import 'dart:convert';
import 'package:connect/app/data/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'https://deze6.com.br/apiConnect';

class ApiClient {

final http.Client httpClient;
ApiClient({@required this.httpClient});

  cadastro(user) async {
    try {
      var response = await httpClient.post('$baseUrl/cadastro.php', body: jsonEncode(user));
      print(response.statusCode.toString());
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        UserModel userModel = user;
        userModel.statusPagamento = jsonResponse['cadastro']['mensalidade'] == 'false' ? false : true;
        return userModel;
      } else
        print('erro ao adicionar usuário');
    } finally { }
  }

  login(user) async {
    try{
      var response = await httpClient.post('$baseUrl/login.php', body: jsonEncode({'email':user.email, 'senha':user.senha }));
      if(response.statusCode == 200){
        print('logado com sucesso');
        print(response.body);
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        UserModel userModel = UserModel();
        userModel.tipo = jsonResponse['usuario']['tipoLogin'];
        userModel.statusPagamento = jsonResponse['usuario']['mensalidade'] == 'false' ? false : true ;
        userModel.nome = jsonResponse['usuario']['nome'];
        print(userModel.statusPagamento.toString());
        print(userModel.tipo);
        return userModel;
      }else { print('erro ao logar'); return 'erro';}
    }finally{}
  }

  getCategorias(){

  }


}