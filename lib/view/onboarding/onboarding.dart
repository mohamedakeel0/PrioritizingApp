import 'package:flutter/material.dart';

import 'package:flutters/shared/componnents/components.dart';
import 'package:flutters/shared/network/local/cache_helper.dart';
import 'package:flutters/shared/style/colors.dart';
import 'package:flutters/view/Home/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  var boardController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'image/image3.jpg',
        title: ' Define Priorities',
        body: 'According to urgent matters'),
    BoardingModel(
        image: 'image/image1.jpg',
        title: 'writing  table',
        body:
            'Concentrate on your goal and don`t think about personal matters'),
    BoardingModel(
        image: 'image/image2.jpg',
        title: 'Focus on one task at a time',
        body: 'Because multitasking kills focus'),
  ];
  bool islast = false;

  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        navigateAndFinish(
          context,
          HomePage(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                navigateTo(context, HomePage());
              },
              child: Text(
                'skip',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(height / 27.5),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      islast = true;
                    });
                  } else {
                    setState(() {
                      islast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) => buildBoardingItem(
                    boarding[index], height / 27.5, height / 55.03),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: height / 16.5,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultcolor,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (islast) {
                      submit();
                    } else {
                      boardController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model, height, height15) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image(
            image: AssetImage('${model.image}'),
          )),
          SizedBox(
            height: height,
          ),
          Text(
            '${model.title}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(
            height: height15,
          ),
          Text(
            '${model.body}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: height15,
          ),
        ],
      );
}

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}
