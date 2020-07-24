// To parse this JSON data, do
//
//     final CategoriaModel = CategoriaModelFromJson(jsonString);

import 'dart:convert';

class CategoriaModel {
    CategoriaModel({
        this.categoria,
        this.idCategoria,
        this.subCategorias,
    });

    String categoria;
    String idCategoria;
    SubCategorias subCategorias;

    factory CategoriaModel.fromRawJson(String str) => CategoriaModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoriaModel.fromJson(Map<String, dynamic> json) => CategoriaModel(
        categoria: json["categoria"],
        idCategoria: json["idCategoria"],
        subCategorias: SubCategorias.fromJson(json["subCategorias"]),
    );

    Map<String, dynamic> toJson() => {
        "categoria": categoria,
        "idCategoria": idCategoria,
        "subCategorias": subCategorias.toJson(),
    };
}

class SubCategorias {
    SubCategorias({
        this.nome,
        this.idSubCategoria,
    });

    String nome;
    String idSubCategoria;

    factory SubCategorias.fromRawJson(String str) => SubCategorias.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SubCategorias.fromJson(Map<String, dynamic> json) => SubCategorias(
        nome: json["nome"],
        idSubCategoria: json["idSubCategoria"],
    );

    Map<String, dynamic> toJson() => {
        "nome": nome,
        "idSubCategoria": idSubCategoria,
    };
}
