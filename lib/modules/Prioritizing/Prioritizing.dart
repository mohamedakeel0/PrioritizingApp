import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutters/layout/cubic/cubic.dart';
import 'package:flutters/layout/cubic/states.dart';
import 'package:flutters/shared/componnents/components.dart';
import 'package:flutters/shared/style/colors.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../../modelperson.dart';

class PrioritizingScreen extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var textController;
  final persons = Hive.box('Persons2');

  @override
  Widget build(BuildContext context) {
    textController = TextEditingController();
    return BlocConsumer<ActivateCubic, ActivateStates>(
      listener: (context, state) {},
      builder: (context, state) {
        int maxheight = MediaQuery.of(context).size.height.toInt();
        int maxwidth = MediaQuery.of(context).size.width.toInt();
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        var cubic = ActivateCubic.get(context);
        return Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: defaultcolor,
              ),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                margin: EdgeInsets.symmetric(horizontal: width / 49.1),
                elevation: 10,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width / 41.27,
                        right: width / 19.27,
                        top: height / 27.51,
                        bottom: height / 27.51),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(height / 20.636),
                                color: Colors.blueGrey),
                            height: height / 27.5,
                            width: width / 2.31,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, left: 4),
                              child: Text(
                                'Planning for ${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height / 82.545,
                          ),
                          AutoSizeText(
                            'Enter what you want to do tomorrow ?',
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black, fontSize: 30),
                          ),
                          SizedBox(
                            height: height / 33.018,
                          ),
                          AutoSizeText(
                            'Enter each priority and submit each one individually. Select the priority level.',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: Colors.grey[600], fontSize: 18),
                          ),
                          SizedBox(
                            height: height / 55.03,
                          ),
                          defaultFormField(
                              controller: textController,
                              type: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter your priority';
                                }
                              },
                              label: 'Enter priority',
                              prefix: Icons.list),
                          SizedBox(
                            height: height / 41.27,
                          ),
                          TextFormField(
                            readOnly: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your time';
                              }
                            },
                            controller: timeController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                              hintText: 'Pick your Time',
                              prefixIcon: Icon(
                                Icons.watch_later_outlined,
                              ),
                            ),
                            onTap: () async {
                              var time = await showTimePicker(
                                initialTime: TimeOfDay.now(),
                                context: context,
                              );
                              timeController.text = time!.format(context);
                            },
                          ),
                          SizedBox(
                            height: height / 41.27,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Choose the priority :',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.black, fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            height: height / 55.03,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 13.09, right: width / 26.2),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      print(height);
                                      print(width);
                                      cubic.ChangeBottom(0);
                                    },
                                    child: Text('Low'),
                                    style: ElevatedButton.styleFrom(
                                      primary: cubic.selectedIndex == 0
                                          ? Colors.blueGrey
                                          : Colors.grey[400],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      cubic.ChangeBottom(1);
                                    },
                                    child: Text('Medium'),
                                    style: ElevatedButton.styleFrom(
                                      primary: cubic.selectedIndex == 1
                                          ? Colors.blueGrey
                                          : Colors.grey[400],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      cubic.ChangeBottom(2);
                                    },
                                    child: Text('High'),
                                    style: ElevatedButton.styleFrom(
                                      primary: cubic.selectedIndex == 2
                                          ? Colors.blueGrey
                                          : Colors.grey[400],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 41.27,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              defaultButton(
                                  width: width / 3.27,
                                  function: () {
                                    if (formkey.currentState!.validate()) {
                                      print(cubic.selectedIndex);
                                      ModelPerson person = ModelPerson(
                                          id: Random().nextInt(60000000),
                                          text: textController.text,
                                          time: timeController.text,
                                          valuelow: false,
                                          priority: cubic.selectedIndex,
                                          valuemeduim: false,
                                          textfuture: 'mohamed',
                                          valueHigh: false);

                                      persons.put(person.id, person);
                                      print(person.priority);
                                    }
                                  },
                                  text: 'Send',
                                  isUpperCase: true),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List<int> low = [];
  int numberlow = 0;
  List<int> Medium = [];
  int numberMedium = 1;
  List<int> High = [];
  int numberHigh = 0;

  int? choosenumberplority(int numberplority) {
    switch (numberplority) {
      case 0:
        numberlow = numberlow + 1;
        low.add(numberlow);
        break;
      case 1:
        numberMedium = numberMedium + 1;
        Medium.add(numberMedium);
        break;
      case 2:
        numberHigh = numberHigh + 1;
        High.add(numberHigh);
        break;
    }
    return 0;
  }
}
