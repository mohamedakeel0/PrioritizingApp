
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'modelperson.g.dart';

@HiveType(typeId: 0)
class ModelPerson extends HiveObject {
  @HiveField(0)
  final String? text;
  @HiveField(1)
  final String? time;
  @HiveField(2)
  final  bool? valuelow;
  @HiveField(3)
  final  int? priority;
  @HiveField(4)
  final  String? textfuture;
  @HiveField(5)
  final  bool? valuemeduim;
  @HiveField(6)
    bool? valueHigh;
  @HiveField(7)
  final  int? id;

  ModelPerson({
    required  this.text,
    required  this.time,
    required  this.valuelow,
    required  this.priority,
    required  this.textfuture,
    required  this.valuemeduim,
    required  this.valueHigh,
    required  this.id,
  });

}