import 'package:ecourses/components/cards/recent_course_card.dart';
import 'package:ecourses/constants.dart';
import 'package:ecourses/model/course.dart';
import 'package:flutter/material.dart';

import 'components/home_screen_navbar.dart';
import 'components/lists/explore_course_list.dart';
import 'components/lists/recent_course_list.dart';
import 'screens/sidebar_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Courses',
        theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Animation<Offset> sidebarAnimation;
  AnimationController sidebarAnimationController;
  Animation<double> fadeAnimation;
  bool sidebarHidden = true;

  @override
  void initState() {
    super.initState();
    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 250,
      ),
    );
    sidebarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: sidebarAnimationController,
      curve: Curves.easeInOut,
    ));
    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: sidebarAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    sidebarAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    HomeScreenNavBar(
                      triggerAnimation: () {
                        setState(() {
                          sidebarHidden = !sidebarHidden;
                        });
                        sidebarAnimationController.forward();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Recents',
                            style: kLargeTitleStyle,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '23 courses , more coming',
                            style: kSubtitleStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RecentCourseList(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 25.0, bottom: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Explore',
                            style: kTitle1Style,
                          )
                        ],
                      ),
                    ),
                    ExploreCourseList(),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              IgnorePointer(
                ignoring: sidebarHidden,
                child: Stack(
                  children: [
                    FadeTransition(
                      opacity: fadeAnimation,
                      child: GestureDetector(
                        onTap: () {
                             setState(() {
                          sidebarHidden = !sidebarHidden;
                        });
                          sidebarAnimationController.reverse();
                        },
                        child: Container(
                          color: Color.fromRGBO(36, 38, 41, 0.4),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: sidebarAnimation,
                      child: SafeArea(
                        child: SidebarScreen(),
                        bottom: false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
