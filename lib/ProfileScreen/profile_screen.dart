import 'package:flutter/material.dart';
import '../Constant/images.dart';
import 'user_profile_tab.dart';
import 'career_status_tab.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar:  AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Image(image: const AssetImage(imagesTeam11,),height:heights/15,width:widths/5,
          ),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),
            indicatorWeight: 5,
            indicatorColor: Colors.red,
            indicatorPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            tabs: [
              Tab( text: "My Profile",),
              Tab( text: "Career Status")
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MyProfileTab(),
            CareerStatusTab(),
          ],
        ),
      ),
    );
  }
}
