import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop_app/shared/components/components.dart';

import '../../Login/login_screen.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String title;
  final String image;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class onBoardScreen extends StatefulWidget {
  @override
  State<onBoardScreen> createState() => _onBoardScreenState();
}

class _onBoardScreenState extends State<onBoardScreen> {
  var pageController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onBoarding.png',
      title: 'On Board 1 title',
      body: 'On Board 1 body',
    ),
    BoardingModel(
      image: 'assets/images/onBoarding2.png',
      title: 'On Board 2 title',
      body: 'On Board 2 body',
    ),
    BoardingModel(
      image: 'assets/images/onBoarding3.png',
      title: 'On Board 3 title',
      body: 'On Board 3 body',
    ),
  ];

  bool isLast = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:
        [
          TextButton(
              onPressed: ()
              {
                NavigateToFinish(context,LoginScreen());
              },
              child: Text(
                "SKIP",
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                onPageChanged: (int index) {
                    if(index == boarding.length - 1)
                    {
                      setState(() {
                        isLast =true;
                      });
                      print("last");
                    }
                    else
                      {
                        setState(() {
                          isLast =false;
                        });
                        print("not last");
                      }
                },
                controller: pageController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                Smooth

                Text(
                  "Indecator",
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if(isLast)
                      {
                        NavigateToFinish(context,LoginScreen());
                      }
                    else
                      {
                        pageController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }


                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildBoardingItem(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${model.image}'),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          "${model.title}",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          "${model.body}",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
