// ignore_for_file: dead_code

import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutters/layout/cubic/cubic.dart';
import 'package:flutters/layout/cubic/states.dart';
import 'package:flutters/models/modelperson.dart';
import 'package:flutters/shared/componnents0/components.dart';
import 'package:flutters/shared/network/local/cache_helper.dart';
import 'package:hive/hive.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ListDay extends StatelessWidget {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(create: ( BuildContext context)=>ActivateCubic()..getFromHive(),
      child: BlocConsumer<ActivateCubic, ActivateStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubic = ActivateCubic.get(context);

          return buildToDolist(cubic,context,height,width,);
        },
      ),
    );
  }
}


