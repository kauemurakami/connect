import 'package:connect/app/data/repository/notificacao_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class NotificacaoController extends GetxController {

  final NotificacaoRepository repository;
  NotificacaoController({@required this.repository}) : assert(repository != null);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}