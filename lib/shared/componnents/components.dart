import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutters/layout/cubic/cubic.dart';
import 'package:flutters/modelperson.dart';
import 'package:flutters/modules/Prioritizing/Prioritizing.dart';
import 'package:flutters/modules/Rules/Rules.dart';
import 'package:flutters/modules/TheTimeofConcentration/TimetoFocus.dart';
import 'package:flutters/modules/YourDreamInthisyear/Dream.dart';
import 'package:flutters/modules/keepingList/List.dart';
import 'package:flutters/shared/style/colors.dart';
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
Widget buildHome(context,height,width,)=>Scaffold(
  body: SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: height / 10.25),
        Text(
          'Top Time Management Skills',
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 27,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: height / 16.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildItemhome(PrioritizingScreen(), context, height, width,
                'Prioritizing', 'image/prioritisations.jpg'),
            SizedBox(
              width: width / 15.71,
            ),
            buildItemhome(YourDreams(), context, height, width,
                'Your dreams for this year ', 'image/dream.jpg'),
          ],
        ),
        SizedBox(
          height: height / 33.018,
        ),
        buildItemhome(ListDay(), context, height, width,
            'Keeping a To-Do List', 'image/list.jpg'),
        SizedBox(
          height: height / 33.018,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildItemhome(Rules(), context, height, width, 'The Rules ',
                'image/rules.jpg'),
            SizedBox(
              width: width / 15.71,
            ),
            buildItemhome(CountdownPage(), context, height, width,
                'The time of Concentration', 'image/time.jpg'),
          ],
        ),
      ])),
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
Widget buildItemDream(context,height,width,)=>Container(color: Colors.white,
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


  body: Column(children: [
    Container(height: height/3.57,
      child: Stack(children: [
        Container(height:200,child: Padding(
          padding:  EdgeInsets.only(left: height/44.272,top:  height/18.509,right: height/44.272,),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,children: [
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
                      'write what  you want to achive in the future :',
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

          ],),
        ),
          decoration: BoxDecoration(
              color:defaultcolor,
              borderRadius: new BorderRadius.vertical(
                  bottom: Radius.elliptical(150, 30)
              )),),
        Container(),
        Positioned( top: 150.0,
          left: 15.0,
          right: 15.0,
          child: Card(clipBehavior: Clip.antiAliasWithSaveLayer,elevation: 5,
            child: Padding(
              padding:  EdgeInsets.only(top: height/164.09),
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
        ),
      ],

      ),
    ),
    Padding(
      padding:  EdgeInsets.only( top:height/59.27,right: width/39.3, left:  width/39.3,),
      child: Card(  clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.symmetric(horizontal: height/103.1),
        elevation: 10,
        color: Colors.white,
        child: Container(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  left: width / 30.21,
                  top: height / 82.545,
                  right: width / 30.21),
              child: Container(height: 40,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(height / 82.545),
                  color: Colors.grey[100],
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height/41.27,),
                    AutoSizeText(
                      'Your dreams for this year ',
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.black87, fontSize: 25),
                    ),SizedBox(height: height/82.5,),
                  ],
                ),
              ),
            ),



            ActivateCubic.get(context).persons.isNotEmpty? buildItemDream(context,height,width):Container(),

          ],

          ),
        ),
      ),
    )




  ],),);
Widget buildToDolist(cubic,context,height,width,)=>Scaffold(backgroundColor:defaultcolor ,
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
Widget buildRules(context,height,width,titles)=>SingleChildScrollView(
  child: Column(children: [
    Container(height: height/6.34,
      child: Stack(children: [
        Container(height:height/8.25,width:width,

          decoration: BoxDecoration(
              color:defaultcolor,
              borderRadius: new BorderRadius.vertical(
                  bottom: Radius.elliptical(150, 30)
              )),),
        Container(),
        Positioned( top: height/16.509,
          left: width/26.18,
          right: width/26.18,
          child:    Card(clipBehavior: Clip.antiAliasWithSaveLayer,elevation: 5,color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                'If you follow these tips for 30 days you can be more successful :',
                maxLines: 2,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black, fontSize: 25,fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ],

      ),
    ),


    buildItemRules(context,height,width,titles),
  ],),
);
Widget buildItemRules(context,height,width,titles)=>  Padding(
  padding:  EdgeInsets.only(top: height/103.03,right: width/19.27,left: width/19.27),
  child: Container(

    child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(children: [
            Icon(
              Icons.star_border_purple500_sharp,
              size: 25,
              color: Colors.blueGrey,
            ),
            SizedBox(width: width/78.54,),
            Expanded(
              child: AutoSizeText(
                titles[index], overflow: TextOverflow.ellipsis,maxLines: 4,

                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black87, fontSize: 20),
              ),
            ),
          ],);
        }, separatorBuilder: (context, index) =>Container(height: height/55.03,) , itemCount: titles.length),
  ),
);
