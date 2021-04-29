import 'package:ecourses/components/cards/continue_watching_card.dart';
import 'package:ecourses/model/course.dart';
import 'package:flutter/material.dart';

class ContinueWatchingList extends StatefulWidget {
  @override
  _ContinueWatchingListState createState() => _ContinueWatchingListState();
}

class _ContinueWatchingListState extends State<ContinueWatchingList> {
  List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicators() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: continueWatchingCourses.map((course) {
          var index = recentCourses.indexOf(course);
          return Container(
            height: 7.0,
            width: 7.0,
            margin: EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  currentPage == index ? Color(0xFF0971FE) : Color(0xFFA6AEBD),
            ),
          );
        }).toList());
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.0,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return ContinueWatchingCard(
                course: continueWatchingCourses[index],
              );
            },
            itemCount: continueWatchingCourses.length,
            controller: PageController(
              initialPage: 0,
              viewportFraction: 0.75,
            ),
            onPageChanged: (index) {
              setState(
                () {
                  currentPage = index;
                },
              );
            },
          ),
        ),
        updateIndicators()
      ],
    );
  }
}

