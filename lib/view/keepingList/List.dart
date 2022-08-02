import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutters/bloc/cubic.dart';
import 'package:flutters/bloc/states.dart';

import 'package:flutters/shared/componnents/components.dart';
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


