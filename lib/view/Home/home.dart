import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutters/bloc/cubic.dart';
import 'package:flutters/bloc/states.dart';

import 'package:flutters/shared/componnents/components.dart';
import 'package:flutters/shared/network/local/cache_helper.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivateCubic, ActivateStates>(
      listener: (context, state) {},
      builder: (context, state) {
        CacheHelper.saveData(key: 'home', value: true);
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        return buildHome(context,height,width,);
      },
    );
  }
}
