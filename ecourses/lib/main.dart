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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              HomeScreenNavBar(),
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
                height: 20.0,
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
              ExploreCourseList()
            ],
          ),
        ),
      ),
    );
  }
}
