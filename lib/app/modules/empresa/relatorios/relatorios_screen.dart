import 'package:connect/app/data/provider/app_provider.dart';
import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmpresaRelatoriosScreen extends StatelessWidget {
//repository injection
  final EmpresaRepository repository =
      EmpresaRepository(apiClient: ApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text('empresa relatorios')),
    );
  }
}
