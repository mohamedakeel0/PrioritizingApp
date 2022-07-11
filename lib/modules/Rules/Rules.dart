
import 'package:flutter/material.dart';
import 'package:flutters/shared/componnents/components.dart';
class Rules extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(

      body: buildRules(context,height,width,titles));
  }
  List<String> titles = [
    'Be closer to allah .',
    'Sleep 8 hours .',
    'Drink more water .',
    'Get exposed to the sun .',
    'Avoid sugar .',
    'Plan the whole week .',
    'Don\'t make many tasks at the same time .',
    'Arrange your prioities .',
    'Make routine and keep it .',
    'Take intermittent breaks .',
    'Always complete what you started  .',
    'Work with intelligence ، Not with effort .',
    'Learn  to say no .',

  ];
}
