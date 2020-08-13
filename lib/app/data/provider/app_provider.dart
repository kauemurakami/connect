import 'dart:convert';
import 'package:connect/app/data/model/cadastros_model.dart';
import 'package:connect/app/data/model/categoria_servico_model.dart';
import 'package:connect/app/data/model/categorias_model.dart';
import 'package:connect/app/data/model/servicos_categoria.dart';
import 'package:connect/app/data/model/unidade_servico_model.dart';
import 'package:connect/app/data/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'https://deze6.com.br/apiConnect';
const token = r'DOPAInbdsc12fdskp$*&';

class ApiClient {
  final http.Client httpClient;
  ApiClient({@required this.httpClient});

  getServicos(idCategoriaServico, idEmpresa) async {
    try {
      var response = await httpClient.post('$baseUrl/servicos.php',
          body: jsonEncode({
            "token": token,
            "idEmpresa": idEmpresa,
            "idCategoriaServico": idCategoriaServico
          }));
      if (response.statusCode == 200) {
        return ServicosCategoria.fromJson(json.decode(response.body));
      }
    } finally {}
  }

  addDemandaServico(demanda, servicos) async {
    try {
      print(servicos);
      var response = await httpClient.post('$baseUrl/cadastro-servico.php',
          body: jsonEncode({
            "token": token,
            "idEmpresa": demanda.tipoEmpresa,
            "dataInicio": demanda.dataInicio,
            "certificadoObrigatorio": demanda.certificadoObrigatorio,
            "cidade": demanda.cidade,
            "estado": "Minas Gerais",
            "obsServico": "observacao",
            "servicos": demanda.servicos
          }));
      if (response.statusCode == 200) {
        print(response.body);
        print(jsonEncode({
            "token": token,
            "idEmpresa": demanda.tipoEmpresa,
            "dataInicio": demanda.dataInicio,
            "certificadoObrigatorio": demanda.certificadoObrigatorio,
            "cidade": demanda.cidade,
            "estado": "Minas Gerais",
            "obsServico": "observacao",
            "servicos": [servicos]
          }));
        return true;
      }
    } finally {}
  }

  categoriaServico(idEmpresa) async {
    try {
      var response = await httpClient.post('$baseUrl/categoria-servico.php',
          body: jsonEncode({"token": token, "idEmpresa": idEmpresa}));
      if (response.statusCode == 200) {
        return CategoriasServicoModel.fromJson(json.decode(response.body));
      }
    } finally {}
  }

  unidadesServico() async {
    try {
      var response = await httpClient.post('$baseUrl/unidadeServico.php',
          body: jsonEncode({"token": token}));
      if (response.statusCode == 200) {
        return UnidadeServicoModel.fromJson(json.decode(response.body));
      }
    } finally {}
  }

  pagar(user, tipo, cartao) async {
    try {
      var response = await httpClient.post('$baseUrl/pagamento.php',
          body: jsonEncode({
            "tipoPamaneto": tipo.toString(),
            "idCadastro": user.id,
            "cpf_or_cnpjCartao": user.cnpjOrCpf,
            "codCartao": cartao.codigo,
            "nomeCartao": cartao.nome,
            "aValidade": '${cartao.validade[3]}${cartao.validade[4]}}',
            "mValidade": '${cartao.validade[0]}${cartao.validade[1]}} ',
            "nCartao": cartao.numero
          }));
      print(response.statusCode.toString());
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else
        print('erro ao pagar');
    } finally {}
  }

  cadastro(user) async {
    try {
      var response = await httpClient.post('$baseUrl/cadastro.php',
          body: jsonEncode(user));
      print(response.statusCode.toString());
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        UserModel userModel = user;
        userModel.statusPagamento =
            jsonResponse['cadastro']['mensalidade'] == 'false' ? false : true;
        return userModel;
      } else
        print('erro ao adicionar usuário');
    } finally {}
  }

  login(user) async {
    try {
      var response = await httpClient.post('$baseUrl/login.php',
          body: jsonEncode({'email': user.email, 'senha': user.senha}));
      if (response.statusCode == 200) {
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
        userModel.statusPagamento =
            jsonResponse['usuario']['mensalidade'] == 'false' ? false : true;
        userModel.nome = jsonResponse['usuario']['nome'];
        print(userModel.statusPagamento.toString());
        print(userModel.tipo);
        return userModel;
      } else {
        print('erro ao logar');
        return 'erro';
      }
    } finally {}
  }

  getCategorias() async {
    try {
      var response = await httpClient.post('$baseUrl/categorias.php',
          body: jsonEncode({"token": token}));
      if (response.statusCode == 200) {
        return CategoriasModel.fromJson(json.decode(response.body));
      }
    } finally {}
  }

  recuperarSenha(email) async {
    try {
      var response = await httpClient.post('$baseUrl/resetar-senha.php',
          body: jsonEncode({"email": email}));
      print(response.statusCode.toString());
      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse['mensagemErro'].toString();
      }
    } finally {}
  }

  editarPerfil(user) async {
    try {
      var response = await httpClient.post('$baseUrl/dados-perfil.php',
          body: jsonEncode({
            "token": token,
            "tipo": user.tipo,
            "idCadastro": user.id,
            "cnpj": user.cnpjOrCpf,
            "nomeEmpresa": user.id,
            "cidade": user.cidade,
            "estado": user.estado,
            "endereco": user.endereco,
          }));
      print(response.statusCode.toString());
      print(response.body);
      if (response.statusCode == 200) {
        return true;
      } else
        print('erro ao adicionar usuário');
    } finally {}
  }

  getUsuariosHome(user, pagina) async {
    try {
      var response = await httpClient.post('$baseUrl/home.php',
          body: jsonEncode({
            "token": token,
            "tipo": user.tipo,
            "idCadastro": user.id,
            "pagina": pagina
          }));
      print(response.statusCode.toString());
      //print(response.body);
      if (response.statusCode == 200) {
        return Cadastro.fromJson(json.decode(response.body));
      } else
        print('erro ao adicionar usuário');
    } finally {}
  }
}
