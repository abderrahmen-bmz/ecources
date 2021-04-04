import 'package:ecourses/components/cards/recent_course_card.dart';
import 'package:ecourses/constants.dart';
import 'package:ecourses/model/course.dart';
import 'package:flutter/material.dart';

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
                RecentCourseCard(
                  course: recentCourses[0],
                ),
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
          child: Container(
         child: TextField(
           cursorColor: kPrimaryLabelColor,
           decoration: InputDecoration,
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
