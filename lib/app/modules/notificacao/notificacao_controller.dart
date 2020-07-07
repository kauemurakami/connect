import 'package:connect/app/data/repository/notificacao_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class NotificacaoController extends GetxController {

  final NotificacaoRepository repository;
  NotificacaoController({@required this.repository}) : assert(repository != null);

  final _notificacao = Get.arguments.obs;
  get notificacao => this._notificacao.value;
  set notificacao(value) => this._notificacao.value = value;
  
}