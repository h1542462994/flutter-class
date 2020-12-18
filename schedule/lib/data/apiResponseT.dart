import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:schedule/data/apiResponse.dart';


@JsonSerializable()
class ApiResponseT<T> {
  ApiResponseT();

  num code;
  String summary;
  String message;
  Map<String, dynamic> raw;
  T data;


  factory ApiResponseT.part(ApiResponse response) {
    ApiResponseT<T> r = ApiResponseT();
    r.code = response.code;
    r.summary = response.summary;
    r.message = response.message;
    r.raw = response.data;
    return r;
  }

  ApiResponseT apply(T data) {
    this.data = data;
    return this;
  }

  @override
  String toString() {
    return <String, dynamic> {
      'code': code,
      'summary': summary,
      'message': message,
      'data': raw
    }.toString();
  }
}