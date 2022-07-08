
import 'dart:math';

import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutters/layout/cubic/states.dart';
import 'package:flutters/models/modelperson.dart';


import 'package:flutters/modules/YourDreamInthisyear/Dream.dart';
import 'package:flutters/modules/keepingList/List.dart';
import 'package:flutters/shared/network/local/cache_helper.dart';
import 'package:hive_flutter/hive_flutter.dart';


class ActivateCubic extends Cubit<ActivateStates> {
  ActivateCubic() : super(ActivateInitailState());

  static ActivateCubic get(context) => BlocProvider.of(context);

  int selectedIndex = 0;
  void ChangeBottom(int index) {
    selectedIndex = index;
    emit(ShopChangeBottomState());
  }

List persons=[];
  List low = [];

  List Medium = [];

  List High = [];

  getFromHive(){
    final personsBox=  Hive.box('Persons2');
  persons=  personsBox.values.toList();
    personsBox.values.forEach((element) {
      if(element.priority==2){
        High.add(element);
      }else if (element.priority==1){
        Medium.add(element);
      }else{
        low.add(element);
      }
    });
    emit(AddOnListState());
  }
  updatePersonDone(int personId,bool value,int index){
    final personsBox=  Hive.box('Persons2');
    persons[index].valueHigh=value;

    personsBox.put(personId, persons[index]);
    emit(updatePersonDoneState());
  }

  DeleteValueOnhive(int personId,index){
    final personsBox=  Hive.box('Persons2');
    persons.remove(persons[index]);
    personsBox.delete(personId);

    getFromHive();
    emit(DeleteValueOnhiveState());
  }

}