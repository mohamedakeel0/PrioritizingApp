import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutters/layout/cubic/cubic.dart';
import 'package:flutters/layout/cubic/states.dart';
import 'package:flutters/models/modelperson.dart';
import 'package:flutters/modules/keepingList/List.dart';
import 'package:flutters/shared/componnents0/components.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class YourDreams extends StatelessWidget {

  var textController = TextEditingController();


  final persons=  Hive.box('Persons2');
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: ( BuildContext context)=>ActivateCubic()..getFromHive(),
      child: BlocConsumer<ActivateCubic, ActivateStates>(
          listener: (context, state) {},
          builder: (context, state) {

            double height=MediaQuery.of(context).size.height;
            double width=MediaQuery.of(context).size.width;

            return buildDream(context,height,width,textController,persons);
          }),
    );
  }
}

