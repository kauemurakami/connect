part of './app_pages.dart';
abstract class Routes{

  static const INITIAL = '/';
  static const LOGIN = '/login';
  static const CADASTRO = '/cadastro';
  static const ADD_CARTAO = '/add-cartao';
	static const CONF_PAGAMENTO = '/confirmacao-pagamento';
	static const PAGAMENTO = '/pagamento';
	static const SERVICOS_CADAST = '/sercivos-cadastrados';
	static const SERVICOS_CONTRAT = '/sercivos-contratados-prestados';
	static const SERVICOS_CONTRAT_PRESTADO = '/sercivo-contratado-prestado';
  static const VALIDAR_CERTIF = '/validar-certificacoes';
	static const AGENDAR_CONTATACAO = '/agendar-contratacao';
	static const EDIT_PERFIL_EMPRESA = '/editar-perfil-empresa';
	static const NOTIFICACOES = '/notificacoes';
	static const NOTIFICACAO = '/notificacao';
	static const AVALIACAO_SERV = '/avalaiacao-servico';
	static const PESQ_PRESTAD = '/pesquisar-prestadores';
  static const RECU_SENHA = '/recuperar-senha';
  static const ALTERAR_SENHA = '/alterar-senha';
	static const CAD_DEMAND = '/cadastro-e-demandas';
  static const HOME_EMPRESA = '/home-empresa';
	static const TODOS_SERV_PRESTAD = '/todos-servicos-prestador';
	static const DETALHE_SERVIC = '/detalhe-servico';
	static const ADD_SERVICO = '/add-servico';
	static const OFERECER_SERVICO = '/oferecer-servico';

  static const HOME_PRESTADOR = '/home-prestador';
	static const EDIT_PERFIL_PRESTADOR = '/editar-perfil-prestador';

}