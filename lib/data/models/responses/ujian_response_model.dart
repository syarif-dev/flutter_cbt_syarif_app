import 'package:meta/meta.dart';
import 'dart:convert';

class UjianResponseModel {
  final String message;
  //timer
  final int timer;
  final List<Datum> data;

  UjianResponseModel({
    required this.message,
    required this.data,
    required this.timer,
  });

  factory UjianResponseModel.fromJson(String str) =>
      UjianResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UjianResponseModel.fromMap(Map<String, dynamic> json) =>
      UjianResponseModel(
        message: json["message"],
        timer: json["timer"] ?? 0,
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  final int id;
  final String pertanyaan;
  final String kategori;
  final String jawabanA;
  final String jawabanB;
  final String jawabanC;
  final String jawabanD;

  Datum({
    required this.id,
    required this.pertanyaan,
    required this.kategori,
    required this.jawabanA,
    required this.jawabanB,
    required this.jawabanC,
    required this.jawabanD,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        pertanyaan: json["question"],
        kategori: json["category"],
        jawabanA: json["first_choice"],
        jawabanB: json["second_choice"],
        jawabanC: json["third_choice"],
        jawabanD: json["fourth_choice"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "pertanyaan": pertanyaan,
        "kategori": kategori,
        "jawaban_a": jawabanA,
        "jawaban_b": jawabanB,
        "jawaban_c": jawabanC,
        "jawaban_d": jawabanD,
      };
}
