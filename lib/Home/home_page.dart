// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dream11_pw/Api/Api_controller/walletApi.dart';
import 'package:dream11_pw/Constant/images.dart';
import 'package:dream11_pw/DrawerContent/privacy_policy.dart';
import 'package:dream11_pw/DrawerContent/term_and_condition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../DrawerContent/Settings/settingPage.dart';
import '../DrawerContent/WalletItem/wallet.dart';
import '../DrawerContent/notification_screen.dart';
import '../IntroductionScreen/Introduction_screen.dart';
import '../Provider/view_profile_provider.dart';
import 'HomeWidget/home_cricket_tab_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    getwallet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<ProfileViewProvider>(context).userData;
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child:userData==null?Container(): ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                color: Colors.red,
                child: DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: heights / 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(userData.image.toString()),
                            radius: heights / 20,
                          ),
                          Text(
                            userData.name.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: heights / 50,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Wallet()));
                },
                leading: const Icon(
                  Icons.wallet,
                  color: Colors.black,
                ),
                trailing: const InkWell(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    )),
                title: Text(
                  'My Wallet',
                  style: TextStyle(fontSize: heights / 45),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                title: Text(
                  'Notification',
                  style: TextStyle(fontSize: heights / 45),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationScreen()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.privacy_tip,
                  color: Colors.black,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(fontSize: heights / 45),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPolicy()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.description,
                  color: Colors.black,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                title: Text(
                  'Term and Conditions',
                  style: TextStyle(fontSize: heights / 45),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const TermAndCondition()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: heights / 45),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingPage()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.input,
                  color: Colors.black,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: heights / 45),
                ),
                onTap: ()  {
                  showDialog(
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        backgroundColor: Colors.white,
                        content: Container(
                          height: heights / 3.5,
                          width: widths / 1.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: const AssetImage(imagesTeam11),
                                height: heights / 7,
                                width: widths / 2,
                              ),
                              const Text('Do You want to logout?'),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel')),
                                  InkWell(
                                      onTap: () async {
                                        SharedPreferences prefs =
                                        await SharedPreferences
                                            .getInstance();
                                        prefs.remove('userid');
                                        Navigator.pop(context);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const IntroductionScreen()));
                                      },
                                      child: const Text('Logout')),
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 30,
          centerTitle: true,
          backgroundColor: Colors.red,
          title: const Text(
            'DREAM 11.PW',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Wallet()));
                },
                child: const Icon(
                  Icons.wallet,
                  color: Colors.white,
                )),
            const SizedBox(
              width: 10,
            )
          ],
          iconTheme: const IconThemeData(color: Colors.white),
          bottom:  TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[800],
            indicatorColor:Colors.white,
            indicatorPadding: const EdgeInsets.only(left: 25,right: 25) ,
            tabs: const [
              Tab(
                icon: Icon(Icons.sports_cricket,size: 20,),
                text: "Cricket"
              ),
              Tab(
                  icon: Icon(Icons.sports_football,size: 20,),
                  text: "FootBall"
              ),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            HomeCricketTabBar(),
            Center(child: Text('Coming Soon'),)
          ],
        ),
      ),
    );
  }
}