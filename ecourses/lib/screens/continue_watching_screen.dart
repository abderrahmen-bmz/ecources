import 'package:ecourses/components/lists/continu_watching_list.dart';
import 'package:ecourses/constants.dart';
import 'package:ecourses/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ContinueWatchingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(34.0),
      ),
      color: kCardPopupBackgroundColor,
      boxShadow: [
        BoxShadow(
            color: kShadowColor, offset: Offset(0, -12), blurRadius: 32.0),
      ],
      minHeight: 85.0,
      maxHeight: MediaQuery.of(context).size.height * 0.75,
      panel: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 12.0,
                bottom: 16.0,
              ),
              child: Container(
                width: 42.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: Color(0xFFC5CBD6),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "Continue Watching ",
              style: kTitle1Style,
            ),
          ),
          // ContinueWatchingCard(
          //   course: continueWatchingCourses[0],
          // ),
          ContinueWatchingList(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "Certaficates",
              style: kTitle1Style,
            ),
          ),
          Expanded(child: CertificateViewer()),
        ],
      ),
    );
  }
}

