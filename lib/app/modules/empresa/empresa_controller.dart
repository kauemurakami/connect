import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

class EmpresaController extends GetxController {

  final EmpresaRepository repository;
  EmpresaController({@required this.repository}) : assert(repository != null);

  //telefone da empresa
  ligar() async {
    const url = "tel:(16)999999999";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Aplicativo não encontrado';
    }
  }
}
