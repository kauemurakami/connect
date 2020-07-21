import 'package:connect/app/data/repository/empresa_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class EmpresaHomeController extends GetxController {
  final EmpresaRepository repository;
  EmpresaHomeController({@required this.repository})
      : assert(repository != null);

  final _screen = 0.obs;
  get screen => this._screen.value;
  set screen(value) => this._screen.value = value;
}
