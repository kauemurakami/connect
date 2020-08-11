class UnidadeServicoModel {
  List<UnidadesServico> unidadesServico;
  String mensagemFinal;

  UnidadeServicoModel({this.unidadesServico, this.mensagemFinal});

  UnidadeServicoModel.fromJson(Map<String, dynamic> json) {
    if (json['unidadesServico'] != null) {
      unidadesServico = new List<UnidadesServico>();
      json['unidadesServico'].forEach((v) {
        unidadesServico.add(new UnidadesServico.fromJson(v));
      });
    }
   
    mensagemFinal = json['mensagemFinal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.unidadesServico != null) {
      data['unidadesServico'] =
          this.unidadesServico.map((v) => v.toJson()).toList();
    }
    data['mensagemFinal'] = this.mensagemFinal;
    return data;
  }
}

class UnidadesServico {
  int id;
  String nomeUnidade;

  UnidadesServico({this.id, this.nomeUnidade});

  UnidadesServico.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeUnidade = json['nomeUnidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomeUnidade'] = this.nomeUnidade;
    return data;
  }
}
