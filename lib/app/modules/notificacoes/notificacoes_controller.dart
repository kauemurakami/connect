import 'package:connect/app/data/model/notificacao_model.dart';
import 'package:connect/app/data/repository/notificacao_repository.dart';
import 'package:connect/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class NotificacoesController extends GetxController {
  final NotificacaoRepository repository;
  NotificacoesController({@required this.repository})
      : assert(repository != null);

  final _notificacoes = [
    NotificacaoModel(
        notificacao: "Bem vindo ao nosso sistema", id: 1, data: '1d'),
        NotificacaoModel(notificacao: "Avalie nosso serviço", id: 2, data: '2d'),
        NotificacaoModel(notificacao: "Gostaria de dar alguma sugestão?", id: 3, data: '4d'),
        NotificacaoModel(notificacao: "Saiba a opinião de quem está usando nossos serviços", id: 4, data: '4d'),
        NotificacaoModel(notificacao: "Não encontrou o que estava procurando ? faça uma busca personalizada", id: 5, data: '1m'),
  ].obs;
  get notificacoes => this._notificacoes.value;
  set notificacoes(value) => this._notificacoes.value = value;

  notificacaoDetalhes(notificacao){
    Get.toNamed(Routes.NOTIFICACAO, arguments: notificacao);
  }
}
