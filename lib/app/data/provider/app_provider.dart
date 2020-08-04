import 'dart:convert';
import 'package:connect/app/data/model/cadastros_model.dart';
import 'package:connect/app/data/model/categoria_model.dart';
import 'package:connect/app/data/model/categorias_model.dart';
import 'package:connect/app/data/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'https://deze6.com.br/apiConnect';
const token = r'DOPAInbdsc12fdskp$*&';
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
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        UserModel userModel = UserModel();
        userModel.id = jsonResponse['usuario']['idUsuario'];
        userModel.cidade = jsonResponse['usuario']['cidade'];
        userModel.estado = jsonResponse['usuario']['estado'];
        userModel.cnpjOrCpf = jsonResponse['usuario']['cnpj_or_cpf'];
        userModel.endereco = jsonResponse['usuario']['endereco'];
        userModel.telefone = jsonResponse['usuario']['telefone'];
        userModel.tipo = jsonResponse['usuario']['tipoLogin'];
        userModel.statusPagamento = jsonResponse['usuario']['mensalidade'] == 'false' ? false : true ;
        userModel.nome = jsonResponse['usuario']['nome'];
        print(userModel.statusPagamento.toString());
        print(userModel.tipo);
        return userModel;
      }else { print('erro ao logar'); return 'erro';}
    }finally{}
  }

  getCategorias() async {
    try{
      var response = await httpClient.post('$baseUrl/categorias.php', body: jsonEncode({"token": token}));
      if(response.statusCode == 200){
        return CategoriasModel.fromJson(json.decode(response.body));
      }
    }finally{}
  }

  recuperarSenha(email) async {
    try{
      var response = await httpClient.post('$baseUrl/resetar-senha.php', body: jsonEncode({"email": email}));
      print(response.statusCode.toString());
      if(response.statusCode == 200){
      print(response.body);
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['mensagemErro'].toString();
      }
    }finally{}
  }

  alterarPerfil(usuario) async {
    try{
      var response = await httpClient.post('$baseUrl/resetar-senha.php', body: jsonEncode(
        {"email":'a'}
        ));
      print(response.statusCode.toString());
      if(response.statusCode == 200){
      print(response.body);
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['mensagemErro'].toString();
      }
    }finally{}
  }

  getUsuariosHome(user, pagina) async {
  try {
      var response = await httpClient.post('$baseUrl/home.php', body: jsonEncode({
        "token" : token,
        "tipo" : user.tipo,
        "idCadastro" : user.id,
        "pagina" : pagina
      }));
      print(response.statusCode.toString());
      //print(response.body);
      if (response.statusCode == 200) {
        return Cadastro.fromJson(json.decode(response.body));
      } else
        print('erro ao adicionar usuário');
    } finally { }
  }

}