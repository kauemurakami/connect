import 'package:connect/app/data/model/servicos_categoria.dart';

class DemandaServico {
  int idEmpresa;
  int tipoEmpresa;
  int documentacao;
  String dataInicio;
  int certificadoObrigatorio;
  String cidade;
  String estado;
  String obsServico;
  List<Servicos> servicos;

  DemandaServico(
      {
      this.idEmpresa,
      this.tipoEmpresa,
      this.documentacao,
      this.dataInicio,
      this.certificadoObrigatorio,
      this.cidade,
      this.estado,
      this.obsServico,
      this.servicos});

 DemandaServico.fromJson(Map<String, dynamic> json) {
    idEmpresa = json['idEmpresa'];
    tipoEmpresa = json['tipoEmpresa'];
    documentacao = json['documentacao'];
    dataInicio = json['dataInicio'];
    certificadoObrigatorio = json['certificadoObrigatorio'];
    cidade = json['cidade'];
    estado = json['estado'];
    obsServico = json['obsServico'];
    if (json['servicos'] != null) {
      servicos = new List<Servicos>();
      json['servicos'].forEach((v) {
        servicos.add(new Servicos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idEmpresa'] = this.idEmpresa;
    data['tipoEmpresa'] = this.tipoEmpresa;
    data['documentacao'] = this.documentacao;
    data['dataInicio'] = this.dataInicio;
    data['certificadoObrigatorio'] = this.certificadoObrigatorio;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    data['obsServico'] = this.obsServico;
    if (this.servicos != null) {
      data['servicos'] = this.servicos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Servicoss {
  int idCatServico;
  int idServico;
  String nomeServico;
  int valor;
  int unidade;

  Servicoss(
      {this.idCatServico,
      this.idServico,
      this.nomeServico,
      this.valor,
      this.unidade});

  Servicoss.fromJson(Map<String, dynamic> json) {
    idCatServico = json['idCatServico'];
    idServico = json['idServico'];
    nomeServico = json['nomeServico'];
    valor = json['valor'];
    unidade = json['unidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCatServico'] = this.idCatServico;
    data['idServico'] = this.idServico;
    data['nomeServico'] = this.nomeServico;
    data['valor'] = this.valor;
    data['unidade'] = this.unidade;
    return data;
  }
}