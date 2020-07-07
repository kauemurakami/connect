import 'package:connect/app/data/repository/notificacao_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class NotificacoesController extends GetxController {

  final NotificacaoRepository repository;
  NotificacoesController({@required this.repository}) : assert(repository != null);

}