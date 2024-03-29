

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutters/bloc/cubic.dart';
import 'package:flutters/bloc/states.dart';

import 'package:flutters/modelperson.dart';


import 'package:flutters/shared/network/local/cache_helper.dart';

import 'package:flutters/shared/style/Theme.dart';
import 'package:flutters/view/Home/home.dart';
import 'package:flutters/view/onboarding/onboarding.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'bloc/bloc_observer/blocObserver.dart';







void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    final directory=await path_provider.getApplicationDocumentsDirectory();
    await Hive.initFlutter();
    Hive.init(directory.path);
    Hive.registerAdapter(ModelPersonAdapter());
  SharedPreferences.getInstance();
  Bloc.observer = MyBlocObserver();



    await CacheHelper.init();
    dynamic home=CacheHelper.getData(key: 'home');
    Widget widget;
    if(home!=null  )widget=HomePage();
    else widget=Onboarding();


    final Persons= await Hive.openBox('Persons2');
Hive.box('Persons2').clear();
    runApp(
    MyApp(startWidget: widget,), // Wrap your app

    );


}

class MyApp extends StatelessWidget {
  Widget? startWidget;

  MyApp({required this.startWidget}) ;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: ( BuildContext context)=>ActivateCubic()),
      ],
      child:  BlocConsumer<ActivateCubic, ActivateStates>(
    listener: (context, state) {},
    builder: (context, state) {

       return MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: lightTheme,
    home:startWidget,
       );
    }
    ),);
  }
}

