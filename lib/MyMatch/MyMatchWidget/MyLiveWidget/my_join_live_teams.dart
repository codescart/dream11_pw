import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyJoinLiveTeams extends StatefulWidget {
  const MyJoinLiveTeams({super.key});

  @override
  State<MyJoinLiveTeams> createState() => _MyJoinLiveTeamsState();
}

class _MyJoinLiveTeamsState extends State<MyJoinLiveTeams> {
  @override
  void initState() {
    super.initState();
    // getUserProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (!snapshot.hasData) {
            return const Text('No data available');
          }
          return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> student =
                document.data() as Map<String, dynamic>;
            return Container();
          }).toList());
        });
  }
}
