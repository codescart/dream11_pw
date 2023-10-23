// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:dream11_pw/Home/home_page.dart';
import 'package:dream11_pw/MyMatch/my_match.dart';
import 'package:dream11_pw/Winner/winnerPage.dart';
import '../Api/api_controller.dart';
import '../ProfileScreen/profile_screen.dart';
import '../Provider/view_profile_provider.dart';
import '../Utils/utils.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  ApiController apiController = ApiController();
  final pages = [
    const MyHomePage(),
    const MyMatch(),
    const WinnerPage(),
    const ProfileScreen()
  ];

  int pageIndex = 0;
  int _backButtonPressCounter = 0;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final userData = await apiController.fetchProfileData();
      if (userData != null) {
        Provider.of<ProfileViewProvider>(context, listen: false)
            .setUser(userData);
      }
    } catch (error) {
      // Handle error here
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_backButtonPressCounter == 0) {
          Utils.showToast("Press again to exit");
          _backButtonPressCounter++;
          return false;
        } else {
          SystemNavigator.pop();
          return true;
        }
      },
      child: Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: buildMyNavBar(context),
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.red,
      height: heights / 15,
      width: widths,
      child: Padding(
        padding: EdgeInsets.only(top: heights / 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  child: pageIndex == 0
                      ? const Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 25,
                        )
                      : const Icon(
                          Icons.home_filled,
                          color: Colors.black54,
                          size: 25,
                        ),
                ),
                pageIndex == 0
                    ? const Text(
                        'Home',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )
                    : Container()
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  child: pageIndex == 1
                      ? const Icon(
                          Icons.sports_cricket,
                          color: Colors.white,
                          size: 25,
                        )
                      : const Icon(
                          Icons.sports_cricket,
                          color: Colors.black,
                          size: 25,
                        ),
                ),
                pageIndex == 1
                    ? const Text(
                        'My Match',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:12,
                            fontWeight: FontWeight.bold),
                      )
                    : Container()
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  child: pageIndex == 2
                      ? const Icon(
                          Icons.emoji_events,
                          color: Colors.white,
                          size: 25,
                        )
                      : const Icon(
                          Icons.emoji_events_outlined,
                          color: Colors.black,
                          size: 25,
                        ),
                ),
                pageIndex == 2
                    ? const Text(
                        'winner',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )
                    : Container()
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  child: pageIndex == 3
                      ? const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 25,
                        )
                      : const Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 25,
                        ),
                ),
                pageIndex == 3
                    ? const Text(
                        'Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
