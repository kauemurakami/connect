import 'package:connect/app/modules/add_cartao/add_cartao_page.dart';
import 'package:connect/app/modules/cadastro/cadastro_page.dart';
import 'package:connect/app/modules/confirmacao_pagamento/confirmacao_pagamento_page.dart';
import 'package:connect/app/modules/empresa/detalhes_servico/detalhe_servico_page.dart';
import 'package:connect/app/modules/empresa/editar_perfil/editar_perfil_page.dart';
import 'package:connect/app/modules/empresa/empresa_home_page.dart';
import 'package:connect/app/modules/empresa/prestadores_encontrados/prestadores_encontrados_page.dart';
import 'package:connect/app/modules/empresa/todos_servicos_prestador/todos_servicos_prestador_page.dart';
import 'package:connect/app/modules/login/login_page.dart';
import 'package:connect/app/modules/notificacao/notificacao_page.dart';
import 'package:connect/app/modules/notificacoes/notificacoes_page.dart';
import 'package:connect/app/modules/recuperar-senha/recuperar_senha_page.dart';
import 'package:connect/app/modules/splash/splash_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.INITIAL, page:()=> SplashPage()),
    GetPage(name: Routes.HOME_EMPRESA, page:()=> EmpresaHomePage(),),
    GetPage(name: Routes.LOGIN, page:()=> LoginPage(),),
    GetPage(name: Routes.CADASTRO, page:()=> CadastroPage(),),
    GetPage(name: Routes.ADD_CARTAO, page:()=> AdicionarCartaoPage()),
    GetPage(name: Routes.CONF_PAGAMENTO, page:()=> ConfirmacaoPagamentoPage()),
    GetPage(name: Routes.RECU_SENHA, page:()=> RecuperarSenhaPage()),
    GetPage(name: Routes.PESQ_PRESTAD, page:()=> PrestadoresEncontradosPage()),
    GetPage(name: Routes.TODOS_SERV_PRESTAD, page:()=> TodosServicosPage()),
    GetPage(name: Routes.DETALHE_SERVIC, page:()=> DetalhesServicoPage()),
    GetPage(name: Routes.NOTIFICACOES, page:()=> NotificacoesPage()),
    GetPage(name: Routes.EDIT_PERFIL_EMPRESA, page:()=> EditarPerfilPage()),
    GetPage(name: Routes.NOTIFICACAO, page:()=> NotificacaoPage()),

  ];
}