import 'package:challenges_flutter/line_view.dart';
import 'package:challenges_flutter/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Challenges',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool selected = false;

  bool showSecondPage = false;

  double heightCollapsed = 50;
  double widthCollapsed = 150;

  double height = 50;
  double width = 150;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // Init values
    //height = heightCollapsed;

    double heightExpanded = SizeConfig.screenHeight * 0.5;
    double widthExpanded = SizeConfig.screenWidth;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                onEnd: () {
                  setState(() {
                    if (selected) showSecondPage = true;
                  });
                },
                alignment: selected ? Alignment.topCenter : Alignment.center,
                curve: Curves.linear,
                margin: EdgeInsets.only(bottom: selected ? 0 : 20),
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: Color(0xff4225c7),
                  borderRadius: selected
                      ? BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))
                      : BorderRadius.all(Radius.circular(15)),
                ),
                duration: const Duration(milliseconds: 500),
                child: showSecondPage
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: LineView(),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(22)),
                                    color: Colors.indigo,
                                  ),
                                  width: SizeConfig.screenWidth * 0.25,
                                  height: 100,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: GestureDetector(
                                  onVerticalDragUpdate: (detail) {
                                    double si = SizeConfig.screenHeight * 0.5;
                                    double so = SizeConfig.screenWidth;

                                    if (detail.localPosition.dy >= 0 && detail.localPosition.dx >= 0) {
                                      setState(() {
                                        height = si - detail.localPosition.dy;
                                        width = so - detail.localPosition.dx;
                                        if (height <= 250) {
                                          height = 50;
                                          width = 150;
                                          selected = !selected;
                                          showSecondPage = !showSecondPage;
                                          return;
                                        }
                                      });
                                    }


                                    //print('Tot: ${si - (detail.localPosition.dy / heightCollapsed)}');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(22)),
                                      color: Colors.black,
                                    ),
                                    width: SizeConfig.screenWidth * 0.3,
                                    height: 95,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Lxt Century', style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 11),),
                          SizedBox(height: 3,),
                          Text('Bloody Tear', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(50))),
                                  width: 5,
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.stacked_line_chart_outlined, color: Colors.white,),
                                    Icon(Icons.pause, color: Colors.white,),
                                    Icon(Icons.wifi_tethering, color: Colors.white,),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.sd_card_outlined,
                            color: Colors.white,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = !selected;
                                height = heightExpanded;
                                width = widthExpanded;
                              });
                            },
                            child: Icon(
                              Icons.circle,
                              size: 40,
                            ),
                          ),
                          Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
