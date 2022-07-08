


import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutters/layout/cubic/cubic.dart';
import 'package:flutters/models/modelperson.dart';




Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget defaultFormField({
  required TextEditingController? controller,
  required TextInputType? type,
  EdgeInsetsGeometry? contentPadding,
  TextStyle? textStyle,
  TextStyle? labelStyle,
  InputBorder? enabledBorder,
  bool isPassword = false,
  ValueChanged? change,
  VoidCallback? suffixPressed,
  required FormFieldValidator validate,
  required String? label,
  IconData? prefix,
  ValueChanged? onSubmit,
  IconData? suffix,
  bool isClickable = true,
  bool isborder = true,
  GestureTapCallback? onTap,

}) =>
    TextFormField(

      onTap: onTap,
      controller: controller,
      style: textStyle,
      keyboardType: type,
      obscureText: isPassword,
      validator: validate,
      enabled: isClickable,
      onChanged: change,
     onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        enabledBorder: enabledBorder,
        labelText: label,
        labelStyle: labelStyle,

        contentPadding: contentPadding,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border:isborder? OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)): OutlineInputBorder(),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      ( route ){return false;},
);

Widget defaultButton({
  double width = double.infinity,
  double height = 50.0,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  bool shape = true,
bool ColorTextblue=true,
  required VoidCallback? function,
  required String text,
}) =>
    Container(clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: function,

        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: ColorTextblue?Colors.white:Colors.blue,
          ),
        ),
      ),
      decoration:shape?ShapeDecoration(
        color: Colors.blueGrey,
        shape: StadiumBorder(
          side: BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
      ):BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );


Widget buildItemperson(height,width,context,numberpriority,typepriority,sumpriority)=>Padding(
  padding: EdgeInsets.only(top: height / 82.545),
  child: Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    margin: EdgeInsets.symmetric(horizontal: width / 49.1),
    elevation: 10,
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: EdgeInsets.only(
              left: width / 30.21,
              top: height / 82.545,
              right: width / 30.21),
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(height / 82.545),
              color: Colors.grey[100],
            ),
            child: Row(
              children: [
                SizedBox(
                  width: width / 39.28,
                ),
                Text(
                  typepriority,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Text(
                  '${sumpriority}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(right: width / 39.3),
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 25,
                    color: Colors.blueGrey,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(
              left: width / 30.21,

              right: width / 30.21),
          child: Container(
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) =>
                  Container(),
              itemBuilder: (context, index) {
                return ConditionalBuilder(condition: ActivateCubic.get(context).persons[index].priority==numberpriority,builder: (context) {
                  return  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: height / 27.5,
                        width: width / 11.22,
                        child: Checkbox(checkColor: Colors.white,
                          value:
                          ActivateCubic.get(context).persons[index].valueHigh,
                          onChanged: (value) {
                            print(value);
                            ActivateCubic.get(context).updatePersonDone(
                                ActivateCubic.get(context).persons[index].id!,
                                value!,
                                index);
                          },
                        ),
                      ),

                      ActivateCubic.get(context).persons[index].valueHigh==false?   Expanded(
                  child: AutoSizeText(
                  ActivateCubic.get(context).persons[index].text!,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(
                  color: Colors.blueGrey,

                  fontSize: 16),
                  ),
                  ):
                      Expanded(
                        child: AutoSizeText(
                          ActivateCubic.get(context).persons[index].text!,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                              color: Colors.grey,
                              decoration:
                              TextDecoration
                                  .lineThrough,
                              fontSize: 16),
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          ActivateCubic.get(context).persons[index].time!,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                              color: Colors.grey,

                              fontSize: 16),
                        ),
                      ),
                  Padding(
                  padding: const EdgeInsets.only(
                  right: 20),
                  child: InkWell(onTap:(){
                  ActivateCubic.get(context).DeleteValueOnhive(ActivateCubic.get(context).persons[index].id,index);
                  },
                  child: Icon(
                  Icons.clear,
                  size: 16,
                  color: Colors.blueGrey,
                  ),
                  ),),
                    ],
                  );
                },fallback: (context) => Container(),

                );
              },
              itemCount: ActivateCubic.get(context).persons.length,
            ),
          ),
        ),
      ],
    ),
  ),
);
Widget buildItemhome(Widget widget,context,height,width,text,image)=>InkWell(
  onTap: () {
    navigateTo(context, widget);
  },
  child: Container(width:  width/2.45,height:height/4.86,decoration: BoxDecoration(borderRadius: BorderRadius.circular(height/20.64),color: Colors.blueGrey,),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
        Container(height:height/6.6,width: width/2.45,clipBehavior: Clip.antiAliasWithSaveLayer,decoration: BoxDecoration(image: DecorationImage(image:AssetImage(image),fit: BoxFit.cover)),
        ),
        Text(
          text,textAlign: TextAlign.center,
          maxLines: 2,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.white, fontSize:17,fontWeight: FontWeight.w600),
        ),
      ],),
    ),
  ),
);
Widget buildItemDream(context,height,width,)=>Container(
  child: ListView.separated(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    separatorBuilder: (context, index) => Container(),
    itemBuilder: (context, index) {

      return   ConditionalBuilder(condition:  ActivateCubic.get(context).persons[index].priority==3,
        builder:(context) => Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: Row(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              SizedBox(width: width/56.1,),
              Container(height: height/27.5,
                width: width/23.6,
                child:Checkbox(
                  value:
                  ActivateCubic.get(context).persons[index].valueHigh,
                  onChanged: (value) {
                    print(value);
                    ActivateCubic.get(context).updatePersonDone(
                        ActivateCubic.get(context).persons[index].id!,
                        value!,
                        index);
                  },
                ),),
              SizedBox(width: width/49.5,),
              ActivateCubic.get(context).persons[index].valueHigh==false?  Expanded(
                child: AutoSizeText(
                   ActivateCubic.get(context).persons[index].textfuture,
                  maxLines: 2,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4!
                      .copyWith(
                      color: Colors.blueGrey[400],
                      fontSize: 18),
                ),
              ) :
              Expanded(
                child: AutoSizeText(
                   ActivateCubic.get(context).persons[index].textfuture,
                  maxLines: 2,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4!
                      .copyWith(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 20),
                child: InkWell(onTap:(){
                  ActivateCubic.get(context).DeleteValueOnhive( ActivateCubic.get(context).persons[index].id,index);
                },
                  child: Icon(
                    Icons.clear,
                    size: 16,
                    color: Colors.blueGrey,
                  ),
                ),),
            ],
          ),
        ), fallback:(context) => Container() ,


      );
    },
    itemCount: ActivateCubic.get(context).persons.length,
  ),
);

Widget buildDream(context,height,width,textController,persons)=>Scaffold(
  backgroundColor: Colors.white,
  body: Padding(
    padding:  EdgeInsets.only(top: height/13.76, right: width/39.3, left:  width/39.3,),
    child: Column(children: [
      Card(clipBehavior: Clip.antiAliasWithSaveLayer,elevation: 5,color:Colors.grey[100],
        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.star_border_purple500_sharp,
              size: 25,
              color: Colors.blueGrey,
            ),SizedBox(width: width/78.544,),
            Expanded(
              child: AutoSizeText(
                'write what want do you want to achive in the future :',
                overflow: TextOverflow.ellipsis,maxLines: 4,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black, fontSize: 25,fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: height/27.5,),
      Card(clipBehavior: Clip.antiAliasWithSaveLayer,elevation: 15,
        child: Padding(
          padding:  EdgeInsets.only(top: height/165.09),
          child: defaultFormField(isborder: false,

              controller: textController,
              type: TextInputType.emailAddress,onSubmit: (value){
                ModelPerson person = ModelPerson(id: Random().nextInt(60000000),
                    text: 'asdasdasd',
                    time: 'asdas',
                    valuelow: false,
                    priority: 3,
                    valuemeduim: false,
                    textfuture:value,
                    valueHigh: false);

                persons.put(person.id, person);
                ActivateCubic.get(context).getFromHive();

              },
              validate: (value) {
                if (value.isEmpty) {
                  return 'please enter your priority';
                }
              },
              label: 'Enter Your dreams for this year',
              prefix: Icons.list),
        ),
      ),
      SizedBox(height: height/13.76,),
      Card(  clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.symmetric(horizontal: height/103.1),
        elevation: 15,
        color: Colors.white,
        child: Column(children: [
          SizedBox(height: height/41.27,),
          AutoSizeText(
            'Your dreams for this year ',
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black87, fontSize: 25),
          ),SizedBox(height: height/82.5,),
          Padding(
            padding:  EdgeInsets.only(right: width/78.5),
            child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [


            ],

            ),
          ),

          ActivateCubic.get(context).persons.isNotEmpty? buildItemDream(context,height,width):Container(),

        ],

        ),
      )




    ],),
  ),);
Widget buildToDolist(cubic,context,height,width,)=>Scaffold(
  appBar: AppBar(
    leading: Icon(Icons.view_headline_sharp),
    backgroundColor: Colors.grey[100],
    elevation: 10,
    title: Text(
      'Today',
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: [
      PopupMenuButton<String>(
          onSelected: (value) {},
          itemBuilder: (BuildContext context) {
            return [


            ];
          })
    ],
  ),
  body: SingleChildScrollView(
    child: Column(
      children: [


        buildItemperson(height,width,context,2,'High priority',cubic.High.length),
        buildItemperson(height,width,context,1,'Medium priority',cubic.Medium.length),
        buildItemperson(height,width,context,0,'Low priority',cubic.low.length),

      ],
    ),
  ),
);