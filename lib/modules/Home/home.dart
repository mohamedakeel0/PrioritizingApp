import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutters/layout/cubic/cubic.dart';
import 'package:flutters/layout/cubic/states.dart';
import 'package:flutters/models/modelperson.dart';
import 'package:flutters/modules/Prioritizing/Prioritizing.dart';

import 'package:flutters/modules/Rules/Rules.dart';
import 'package:flutters/modules/TheTimeofConcentration/TimetoFocus.dart';
import 'package:flutters/modules/YourDreamInthisyear/Dream.dart';
import 'package:flutters/modules/keepingList/List.dart';

import 'package:flutters/shared/componnents0/components.dart';
import 'package:flutters/shared/network/local/cache_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    int maxheight=MediaQuery.of(context).size.height.toInt() ;
    int maxwidth=MediaQuery.of(context).size.width.toInt() ;
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return  BlocConsumer<ActivateCubic, ActivateStates>(
      listener: (context, state) {},
      builder: (context, state) {
        CacheHelper.saveData(
            key: 'home', value: true);
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;

       return Scaffold(
          body: SingleChildScrollView(

              child: Column(children: [

                SizedBox(height: height/10.25),
                Text(
                  'Top Time Management Skills',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: height/16.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildItemhome( PrioritizingScreen(),context,height,width,'Prioritizing','image/prioritisations.jpg'),

                    SizedBox(
                      width:width/15.71,
                    ),
                    buildItemhome( YourDreams(),context,height,width,'Your dreams for this year ','image/dream.jpg'),

                  ],
                ),
                SizedBox(
                  height: height/33.018,
                ),
                buildItemhome( ListDay(),context,height,width,'Keeping a To-Do List','image/list.jpg'),

                SizedBox(
                  height: height/33.018,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildItemhome( Rules(),context,height,width,'The Rules ','image/rules.jpg'),

                    SizedBox(
                      width: width/15.71,
                    ),
                    buildItemhome( CountdownPage(),context,height,width,'The time of Concentration','image/time.jpg'),

                  ],
                ),
              ])),
        );
      },
    );
  }
}
