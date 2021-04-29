import 'dart:math';
import 'package:ecourses/constants.dart';
import 'package:ecourses/screens/continue_watching_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecourses/components/home_screen_navbar.dart';
import 'package:ecourses/components/lists/explore_course_list.dart';
import 'package:ecourses/components/lists/recent_course_list.dart';
import 'package:ecourses/screens/sidebar_screen.dart';


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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: ContinueWatchingScreen(),
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

class CertificateViewer extends StatefulWidget {
  @override
  _CertificateViewerState createState() => _CertificateViewerState();
}

class _CertificateViewerState extends State<CertificateViewer> {
  final List<String> certificatePaths = [
    'asset/certificates/certificate-01.png',
    'asset/certificates/certificate-02.png'
    'asset/certificates/certificate-03.png'
  ];
  Widget certificateViewer;
  @override
  void initState() {
    super.initState();
    List<Widget> imageChildren = [];
    int angleDegree;

    certificatePaths.toList().asMap().forEach((index, certificate) {
      if (index == certificatePaths.length - 1) {
        angleDegree = 0;
      } else {
        angleDegree = Random().nextInt(10) - 5;
      }
      imageChildren.add(
        Transform.rotate(
          angle: angleDegree * (pi / 180),
          child: Image.asset(
            certificate,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );
    });

    certificateViewer = Stack(
      children: imageChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: certificateViewer,
    );
  }
}

