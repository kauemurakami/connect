class NotificacaoModel {

  int id;
  String notificacao;
  String data;

  NotificacaoModel({ this.id, this.notificacao, this.data });

  NotificacaoModel.fromJson(Map<String, dynamic> json){
      this.id = json['id'];
      this.notificacao = json['notificacao'];
      this.data = json['data'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notificacao'] = this.notificacao;
    data['data'] = this.data;

    return data;
  }
}