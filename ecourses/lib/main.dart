import 'package:ecourses/components/cards/recent_course_card.dart';
import 'package:ecourses/constants.dart';
import 'package:ecourses/model/course.dart';
import 'package:flutter/material.dart';

import 'components/lists/recent_course_list.dart';

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
      // home: Scaffold(
      //   body: Center(
      //     child: SidebarScreen(),
      //   ),
      // ),
      home: Scaffold(
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
                // RecentCourseCard(
                //   course: recentCourses[0],
                // ),
                SizedBox(
                  height: 20.0,
                ),
                RecentCourseList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class HomeScreenNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarButton(),
          SearchFieldWidget(),
          Icon(
            Icons.notifications,
            color: kPrimaryLabelColor,
          ),
          SizedBox(
            width: 16.0,
          ),
          CircleAvatar(
            radius: 18.0,
            backgroundImage: AssetImage('asset/images/profile.jpg'),
          )
        ],
      ),
    );
  }
}

class SearchFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 33.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.0),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 12),
                  blurRadius: 16.0,
                )
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              cursorColor: kPrimaryLabelColor,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: kPrimaryLabelColor,
                  size: 20.0,
                ),
                border: InputBorder.none,
                hintText: "Search for courses",
                hintStyle: kSearchPlaceholderStyle,
              ),
              style: kSearchTextStyle,
              onChanged: (newText) {
                print(newText);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SidebarButton extends StatelessWidget {
  const SidebarButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print('Sidebar button pressed');
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: BoxConstraints(
        maxHeight: 40.0,
        maxWidth: 40.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0, 12),
              blurRadius: 16.0,
            ),
          ],
        ),
        child: Image.asset('asset/icons/icon-sidebar.png'),
        color: kPrimaryLabelColor,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 14.0,
      ),
    );
  }
}
