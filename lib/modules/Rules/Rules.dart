import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
class Rules extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    int maxheight=MediaQuery.of(context).size.height.toInt() ;
    int maxwidth=MediaQuery.of(context).size.width.toInt() ;
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: height/11.79,right: width/19.27,left: width/19.27),
          child: Column(children: [


            Card(clipBehavior: Clip.antiAliasWithSaveLayer,elevation: 5,color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  'if you follow these tips for 30 days you can be more successful :',
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.black, fontSize: 25,fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(

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
            )
          ],),
        ),
      ),);
  }
  List<String> titles = [
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
