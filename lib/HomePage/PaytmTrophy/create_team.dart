// // ignore_for_file: depend_on_referenced_packages
//
// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:step_progress_indicator/step_progress_indicator.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:dream11_pw/Model/player_list_model.dart';
// import 'package:dream11_pw/Model/save_team_model.dart';
// import 'package:dream11_pw/Model/cricket_matches_model.dart';
// import 'package:dream11_pw/Constant/api_url.dart';
// import 'package:dream11_pw/HomePage/PaytmTrophy/ActionButton/CreateTeamTab/choose_captain_and_vicecaptain.dart';
// import 'package:dream11_pw/Winner/player_profile.dart';
// import 'package:dream11_pw/zTeamPreview.dart';
//
// class CreateTeam extends StatefulWidget {
//   final UpcomingTeamCricket match;
//   final SaveTeamModel? saveTeamModel;
//
//   const CreateTeam({super.key, required this.match, this.saveTeamModel});
//
//   @override
//   State<CreateTeam> createState() => _CreateTeamState();
// }
//
// class _CreateTeamState extends State<CreateTeam>
//     with TickerProviderStateMixin {
//   // Match_data match = Match_data();
//
//   late TabController tabController;
//
//   late List<bool> batsmenColor = List.filled(30, false, growable: false);
//   late List<bool> bowlerColor = List.filled(30, false, growable: false);
//   late List<bool> wkColor = List.filled(30, false, growable: false);
//   late List<bool> allRounderColor = List.filled(30, false, growable: false);
//
//   late List<String> selectedBatsmen = List.filled(0, '', growable: true);
//   late List<String> selectedBowler = List.filled(0, '', growable: true);
//   late List<String> selectedWk = List.filled(0, '', growable: true);
//   late List<String> selectedAllRounder = List.filled(0, '', growable: true);
//
//   late int wkCount = 0;
//   late int bowlerCount = 0;
//   late int batsmenCount = 0;
//   late int allRounderCount = 0;
//   late int totalPlayers = 0;
//
//   CircularProgressIndicator indicator = const CircularProgressIndicator(
//     backgroundColor: Colors.grey,
//     color: Colors.blueAccent,
//     strokeWidth: 6,
//   );
//
//   @override
//   void initState() {
//     tabController = TabController(length: 4, vsync: this, initialIndex: 0);
//     super.initState();
//     getTeamsPlayersList();
//   }
//
//   void showToast(String msg) {
//     Fluttertoast.showToast(
//         msg: msg,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.red,
//         textColor: Colors.black);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final ple = selectedPlayers.length;
//     final heights = MediaQuery.of(context).size.height;
//     final widths = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//         title: Column(
//           children: <Widget>[
//             Text(
//               'Tue,7 Feb',
//               style: TextStyle(
//                 fontSize: heights / 40,
//               ),
//             ),
//             Text(
//               '${widget.match.teamName1} VS ${widget.match.teamName2}',
//               style: const TextStyle(
//                 fontSize: 10,
//               ),
//             ),
//           ],
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.red,
//       ),
//
//       body: Column(children: <Widget>[
//         Container(
//           color: Colors.red,
//           child: Column(children: <Widget>[
//             Container(
//                 color: Colors.red,
//                 padding: const EdgeInsets.all(5),
//                 child: Text(
//                   'Start time : ${widget.match.matchDateTime}'.split('.').first,
//                   style: const TextStyle(
//                     color: Colors.white,
//                   ),
//                 )),
//             Container(
//                 padding: const EdgeInsets.all(5),
//                 child: Row(children: <Widget>[
//                   Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           'Players',
//                           style: TextStyle(fontSize: heights / 55),
//                         ),
//                         Text(
//                           '$ple/11',
//                           style: TextStyle(
//                             fontSize: heights / 60,
//                           ),
//                         ),
//                       ]),
//                   Expanded(
//                       child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: heights / 40,
//                         backgroundImage: NetworkImage(
//                           '${widget.match.teamImage1}',
//                           // 'images/${widget.team1.toLowerCase()}.jpg'
//                         ),
//                       ),
//                       const Text('  VS  ', style: TextStyle()),
//                       CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: heights / 40,
//                         backgroundImage: NetworkImage(
//                           '${widget.match.teamImage2}',
//                         ),
//                       ),
//                     ],
//                   )),
//                   Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: <Widget>[
//                         Text(
//                           'Credits left',
//                           style: TextStyle(fontSize: heights / 55),
//                         ),
//                         Text(
//                           (100 - cPoints).toString(),
//                           style: TextStyle(fontSize: heights / 60),
//                         ),
//                       ]),
//                 ])),
//             SizedBox(height: heights / 90),
//             Container(
//               padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//               child: StepProgressIndicator(
//                 totalSteps: 11,
//                 currentStep: totalPlayers,
//                 size: 10,
//                 selectedColor: Colors.green,
//                 unselectedColor: (Colors.grey[300])!,
//               ),
//             ),
//             Container(
//               height: heights / 65,
//               width: widths,
//               padding: const EdgeInsets.all(5),
//             )
//           ]),
//         ),
//         SizedBox(
//             height: heights / 20,
//             child: TabBar(
//               unselectedLabelColor: Colors.red,
//               indicatorColor: Colors.red,
//               labelColor: Colors.red,
//               labelStyle: const TextStyle(),
//               tabs: [
//                 Tab(
//                   text: 'WK($wkCount)',
//                 ),
//                 Tab(text: 'BAT($batsmenCount)'),
//                 Tab(text: 'AR($allRounderCount)'),
//                 Tab(text: 'BOWL($bowlerCount)')
//               ],
//               controller: tabController,
//             )),
//         Flexible(
//             child: TabBarView(
//                 physics: const BouncingScrollPhysics(
//                   parent: PageScrollPhysics(),
//                 ),
//                 controller: tabController,
//                 children: <Widget>[
//               (wicketKeeperData.isEmpty)
//                   ? Center(child: indicator)
//                   : ListView(
//                       children: [
//                         Container(
//                             alignment: Alignment.center,
//                             height: heights / 20,
//                             width: widths,
//                             color: Colors.black12,
//                             child: Text(
//                               'Pick 1-8 Wicket keeper',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: heights / 55),
//                             )),
//                         SizedBox(
//                             height: heights / 35,
//                             width: widths,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   'Players',
//                                   style: TextStyle(
//                                       color: Colors.black45,
//                                       fontSize: heights / 55),
//                                 ),
//                                 SizedBox(
//                                   width: widths / 10,
//                                 ),
//                                 Text(
//                                   'Points',
//                                   style: TextStyle(
//                                       color: Colors.black45,
//                                       fontSize: heights / 55),
//                                 ),
//                                 Text(
//                                   'Credits',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: heights / 55,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             )),
//                         const Divider(
//                           color: Colors.grey,
//                         ),
//                         ListView.builder(
//                           itemCount: wicketKeeperData.length,
//                           scrollDirection: Axis.vertical,
//                           physics: const BouncingScrollPhysics(),
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return Column(
//                               children: [
//                                 Container(
//                                   height: heights / 13,
//                                   width: widths,
//                                   decoration: const BoxDecoration(
//                                       border: Border(
//                                           //   top: BorderSide(width: 1,color: Colors.black12),
//                                           bottom: BorderSide(
//                                               width: 1,
//                                               color: Colors.black12))),
//                                   // color: Colors.blue,
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Padding(
//                                         padding:
//                                             EdgeInsets.only(left: heights / 70),
//                                         child: InkWell(
//                                           onTap: (){
//                                             Navigator.push(context,MaterialPageRoute(builder: (context)=>playerprofile(bowldata:wicketKeeperData[index],)));
//                                           },
//                                           child: CircleAvatar(
//
//                                             backgroundImage: NetworkImage(
//                                                 '${wicketKeeperData[index].image}'),
//                                             backgroundColor: Colors.white,
//                                             radius: 20,
//                                           ),
//                                         ),
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           SizedBox(
//                                               width: 70,
//                                               child: Text(
//                                                 '${wicketKeeperData[index].name}',
//                                                 style: TextStyle(
//                                                     fontSize: heights / 70,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               )),
//                                           Text(
//                                             '${wicketKeeperData[index].teamName}',
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: heights / 90),
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons
//                                                     .fiber_manual_record_rounded,
//                                                 size: 7,
//                                                 color: Colors.green,
//                                               ),
//                                               SizedBox(
//                                                 width: widths / 90,
//                                               ),
//                                               Text(
//                                                 'Playing',
//                                                 style: TextStyle(
//                                                     color: Colors.green,
//                                                     fontSize: heights / 95,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         width: widths / 4,
//                                       ),
//                                       Text('${wicketKeeperData[index].points}'),
//                                       SizedBox(
//                                         width: widths / 12,
//                                       ),
//                                       Text(
//                                         "${wicketKeeperData[index].creditPoints}",
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       const VerticalDivider(
//                                         endIndent: 10,
//                                         indent: 7,
//                                         color: Colors.grey,
//                                       ),
//                                       IconButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               if (wkCount < 8 &&
//                                                   wkColor[index] == false &&
//                                                   totalPlayers < 11 && cPoints<93) {
//                                                 selectedPlayers.add(PlayerListModel(
//                                                   id: wicketKeeperData[index].id,
//                                                   pid: wicketKeeperData[index].pid,
//                                                   name: wicketKeeperData[index].name,
//                                                   designationId:
//                                                       wicketKeeperData[index]
//                                                           .designationId,
//                                                   teamId:
//                                                       wicketKeeperData[index]
//                                                           .teamId,
//                                                   playingStatus:
//                                                       wicketKeeperData[index]
//                                                           .playingStatus,
//                                                   creditPoints:
//                                                       wicketKeeperData[index]
//                                                           .creditPoints,
//                                                   points:
//                                                       wicketKeeperData[index]
//                                                           .points,
//                                                   image: wicketKeeperData[index]
//                                                       .image,
//                                                   dob: wicketKeeperData[index]
//                                                       .dob,
//                                                   nationality:
//                                                       wicketKeeperData[index]
//                                                           .nationality,
//                                                   bowls: wicketKeeperData[index]
//                                                       .bowls
//                                                       .toString(),
//                                                   bats: wicketKeeperData[index]
//                                                       .bats
//                                                       .toString(),
//                                                   teamName:
//                                                       wicketKeeperData[index]
//                                                           .teamName
//                                                           .toString(),
//                                                   createdDate:
//                                                       wicketKeeperData[index]
//                                                           .createdDate,
//                                                   modifiedDate:
//                                                       wicketKeeperData[index]
//                                                           .modifiedDate,
//                                                 ));
//
//                                                 wkColor[index] =
//                                                     !wkColor[index];
//                                                 wkCount = wkCount + 1;
//                                                 totalPlayers =
//                                                     totalPlayers + 1;
//                                                 selectedWk.add(
//                                                     wicketKeeperData[index]
//                                                         .toString());
//                                               } else if (wkColor[index] ==
//                                                   true) {
//                                                 wkColor[index] =
//                                                     !wkColor[index];
//                                                 wkCount = wkCount - 1;
//                                                 totalPlayers =
//                                                     totalPlayers - 1;
//                                                 selectedWk.removeWhere(
//                                                     (item) => item == wicketKeeperData[index]);
//                                                 selectedPlayers.removeWhere(
//                                                     (item) =>
//                                                         item.id ==
//                                                         wicketKeeperData[index]
//                                                             .id);
//                                               }
//                                             });
//                                             credit();
//                                           },
//                                           icon: Icon(
//                                               (wkColor[index])
//                                                   ? Icons.remove
//                                                   : Icons.add,
//                                               color: (wkColor[index])
//                                                   ? Colors.red
//                                                   : Colors.green)),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//               (batsmenData.isEmpty)
//                   ? Center(child: indicator)
//                   : ListView(
//                       children: [
//                         Container(
//                             alignment: Alignment.center,
//                             height: heights / 20,
//                             width: widths,
//                             color: Colors.black12,
//                             child: Text(
//                               'Pick 1-8 Batsmen',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: heights / 55),
//                             )),
//                         SizedBox(
//                             height: heights / 35,
//                             width: widths,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   'Players',
//                                   style: TextStyle(
//                                       color: Colors.black45,
//                                       fontSize: heights / 55),
//                                 ),
//                                 SizedBox(
//                                   width: widths / 10,
//                                 ),
//                                 Text(
//                                   'Points',
//                                   style: TextStyle(
//                                       color: Colors.black45,
//                                       fontSize: heights / 55),
//                                 ),
//                                 Text(
//                                   'Credits',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: heights / 55,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             )),
//                         const Divider(
//                           color: Colors.grey,
//                         ),
//                         ListView.builder(
//                           physics: const BouncingScrollPhysics(),
//                           itemCount: batsmenData.length,
//                           scrollDirection: Axis.vertical,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return Column(
//                               children: [
//                                 Container(
//                                   height: heights / 13,
//                                   width: widths,
//                                   decoration: const BoxDecoration(
//                                       border: Border(
//                                           //   top: BorderSide(width: 1,color: Colors.black12),
//                                           bottom: BorderSide(
//                                               width: 1,
//                                               color: Colors.black12))),
//                                   // color: Colors.blue,
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Padding(
//                                         padding:
//                                             EdgeInsets.only(left: heights / 70),
//                                         child:InkWell(
//                                           onTap: (){
//                                             Navigator.push(context,MaterialPageRoute(builder: (context)=>playerprofile(bowldata:batsmenData[index])));
//                                           },
//                                           child: CircleAvatar(
//                                             backgroundImage: NetworkImage(
//                                                 "${batsmenData[index].image}"),
//                                             backgroundColor: Colors.white,
//                                             radius: 20,
//                                           ),
//                                         ),
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           SizedBox(
//                                               width: 70,
//                                               child: Text(
//                                                 '${batsmenData[index].name}',
//                                                 style: TextStyle(
//                                                     fontSize: heights / 70,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               )),
//                                           Text(
//                                             "${batsmenData[index].teamName}",
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: heights / 90),
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons
//                                                     .fiber_manual_record_rounded,
//                                                 size: 7,
//                                                 color: Colors.green,
//                                               ),
//                                               SizedBox(
//                                                 width: widths / 90,
//                                               ),
//                                               Text(
//                                                 'Playing',
//                                                 style: TextStyle(
//                                                     color: Colors.green,
//                                                     fontSize: heights / 95,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         width: widths / 4,
//                                       ),
//                                       Text('${batsmenData[index].points}'),
//                                       SizedBox(
//                                         width: widths / 12,
//                                       ),
//                                       Text(
//                                         '${batsmenData[index].creditPoints}',
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       // SizedBox(width: widths/70,),
//                                       const VerticalDivider(
//                                         endIndent: 10,
//                                         indent: 7,
//                                         color: Colors.grey,
//                                       ),
//                                       IconButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               if (batsmenCount < 8 &&
//                                                   batsmenColor[index] ==
//                                                       false &&
//                                                   totalPlayers < 11 && cPoints<93) {
//                                                 selectedPlayers.add(PlayerListModel(
//                                                   id: batsmenData[index].id,
//                                                   pid: batsmenData[index].pid,
//                                                   name: batsmenData[index].name,
//                                                   designationId: batsmenData[index]
//                                                       .designationId,
//                                                   teamId: batsmenData[index].teamId,
//                                                   playingStatus: batsmenData[index]
//                                                       .playingStatus,
//                                                   creditPoints: batsmenData[index]
//                                                       .creditPoints,
//                                                   points: batsmenData[index].points,
//                                                   image: batsmenData[index].image,
//                                                   dob: batsmenData[index].dob,
//                                                   nationality: batsmenData[index]
//                                                       .nationality,
//                                                   bowls: batsmenData[index]
//                                                       .bowls
//                                                       .toString(),
//                                                   bats: batsmenData[index]
//                                                       .bats
//                                                       .toString(),
//                                                   teamName: batsmenData[index]
//                                                       .teamName
//                                                       .toString(),
//                                                   createdDate: batsmenData[index]
//                                                       .createdDate,
//                                                   modifiedDate: batsmenData[index]
//                                                       .modifiedDate,
//                                                 ));
//
//                                                 batsmenColor[index] =
//                                                     !batsmenColor[index];
//                                                 batsmenCount =
//                                                     batsmenCount + 1;
//                                                 totalPlayers =
//                                                     totalPlayers + 1;
//                                                 selectedBatsmen.add(
//                                                     batsmenData[index].toString());
//                                               } else if (batsmenColor[
//                                                       index] ==
//                                                   true) {
//                                                 batsmenColor[index] =
//                                                     !batsmenColor[index];
//                                                 batsmenCount =
//                                                     batsmenCount - 1;
//                                                 totalPlayers =
//                                                     totalPlayers - 1;
//                                                 selectedPlayers.removeWhere(
//                                                     (item) =>
//                                                         item.id ==
//                                                         (batsmenData[index].id));
//                                               }
//                                             });
//                                             credit();
//                                           },
//                                           icon: Icon(
//                                               (batsmenColor[index])
//                                                   ? Icons.remove
//                                                   : Icons.add,
//                                               color: (batsmenColor[index])
//                                                   ? Colors.red
//                                                   : Colors.green)),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//               (allRounderData.isEmpty)
//                   ? Center(child: indicator)
//                   : ListView(
//                       children: [
//                         Container(
//                             alignment: Alignment.center,
//                             height: heights / 20,
//                             width: widths,
//                             color: Colors.black12,
//                             child: Text(
//                               'Pick 1-8 All- Rounders',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: heights / 55),
//                             )),
//                         SizedBox(
//                             height: heights / 35,
//                             width: widths,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   'Players',
//                                   style: TextStyle(
//                                       color: Colors.black45,
//                                       fontSize: heights / 55),
//                                 ),
//                                 SizedBox(
//                                   width: widths / 10,
//                                 ),
//                                 Text(
//                                   'Points',
//                                   style: TextStyle(
//                                       color: Colors.black45,
//                                       fontSize: heights / 55),
//                                 ),
//                                 Text(
//                                   'Credits',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: heights / 55,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             )),
//                         const Divider(
//                           color: Colors.grey,
//                         ),
//                         ListView.builder(
//                           physics: const BouncingScrollPhysics(),
//                           itemCount: allRounderData.length,
//                           scrollDirection: Axis.vertical,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return Column(
//                               children: [
//                                 Container(
//                                   height: heights / 13,
//                                   width: widths,
//                                   decoration: const BoxDecoration(
//                                       border: Border(
//                                           //   top: BorderSide(width: 1,color: Colors.black12),
//                                           bottom: BorderSide(
//                                               width: 1,
//                                               color: Colors.black12))),
//                                   // color: Colors.blue,
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Padding(
//                                         padding:
//                                             EdgeInsets.only(left: heights / 70),
//                                         child: InkWell(
//                                           onTap: (){
//                                             Navigator.push(context,MaterialPageRoute(builder: (context)=>playerprofile(bowldata:allRounderData[index])));
//                                           },
//                                           child: CircleAvatar(
//                                             backgroundImage: NetworkImage(
//                                                 '${allRounderData[index].image}'),
//                                             backgroundColor: Colors.white,
//                                             radius: 20,
//                                           ),
//                                         ),
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           SizedBox(
//                                               width: 70,
//                                               child: Text(
//                                                 '${allRounderData[index].name}',
//                                                 style: TextStyle(
//                                                     fontSize: heights / 70,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               )),
//                                           Text(
//                                             '${allRounderData[index].teamName}',
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: heights / 90),
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons
//                                                     .fiber_manual_record_rounded,
//                                                 size: 7,
//                                                 color: Colors.green,
//                                               ),
//                                               SizedBox(
//                                                 width: widths / 90,
//                                               ),
//                                               Text(
//                                                 'Playing',
//                                                 style: TextStyle(
//                                                     color: Colors.green,
//                                                     fontSize: heights / 95,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         width: widths / 4,
//                                       ),
//                                       Text(
//                                         '${allRounderData[index].points}',
//                                       ),
//                                       SizedBox(
//                                         width: widths / 12,
//                                       ),
//                                       Text(
//                                         '${allRounderData[index].creditPoints}',
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       // SizedBox(width: widths/70,),
//                                       const VerticalDivider(
//                                         endIndent: 10,
//                                         indent: 7,
//                                         color: Colors.grey,
//                                       ),
//                                       IconButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               if (allRounderCount < 8 &&
//                                                   allRounderColor[index] ==
//                                                       false &&
//                                                   totalPlayers < 11 && cPoints<93) {
//                                                 selectedPlayers.add(PlayerListModel(
//                                                   id: allRounderData[index].id,
//                                                   pid:
//                                                       allRounderData[index].pid,
//                                                   name: allRounderData[index]
//                                                       .name,
//                                                   designationId:
//                                                       allRounderData[index]
//                                                           .designationId,
//                                                   teamId: allRounderData[index]
//                                                       .teamId,
//                                                   playingStatus:
//                                                       allRounderData[index]
//                                                           .playingStatus,
//                                                   creditPoints:
//                                                       allRounderData[index]
//                                                           .creditPoints,
//                                                   points: allRounderData[index]
//                                                       .points,
//                                                   image: allRounderData[index]
//                                                       .image,
//                                                   dob:
//                                                       allRounderData[index].dob,
//                                                   nationality:
//                                                       allRounderData[index]
//                                                           .nationality,
//                                                   bowls: allRounderData[index]
//                                                       .bowls
//                                                       .toString(),
//                                                   bats: allRounderData[index]
//                                                       .bats
//                                                       .toString(),
//                                                   teamName: allRounderData[index]
//                                                       .teamName
//                                                       .toString(),
//                                                   createdDate:
//                                                       allRounderData[index]
//                                                           .createdDate,
//                                                   modifiedDate:
//                                                       allRounderData[index]
//                                                           .modifiedDate,
//                                                 ));
//
//                                                 allRounderColor[index] =
//                                                     !allRounderColor[index];
//                                                 allRounderCount =
//                                                     allRounderCount + 1;
//                                                 totalPlayers =
//                                                     totalPlayers + 1;
//                                                 selectedAllRounder.add(
//                                                     allRounderData[index]
//                                                         .toString());
//                                               } else if (allRounderColor[
//                                                       index] ==
//                                                   true) {
//                                                 allRounderColor[index] =
//                                                     !allRounderColor[index];
//                                                 allRounderCount =
//                                                     allRounderCount - 1;
//                                                 totalPlayers =
//                                                     totalPlayers - 1;
//                                                 selectedPlayers.removeWhere(
//                                                     (item) =>
//                                                         item.id ==
//                                                         (allRounderData[index]
//                                                             .id));
//                                               }
//                                             });
//                                             credit();
//                                           },
//                                           icon: Icon(
//                                               (allRounderColor[index])
//                                                   ? Icons.remove
//                                                   : Icons.add,
//                                               color: (allRounderColor[index])
//                                                   ? Colors.red
//                                                   : Colors.green)),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//               (bowlerData.isEmpty)
//                   ? Center(child: indicator)
//                   : ListView(
//                       children: [
//                         Container(
//                             alignment: Alignment.center,
//                             height: heights / 20,
//                             width: widths,
//                             color: Colors.black12,
//                             child: Text(
//                               'Pick 1-8 Bowlers',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: heights / 55),
//                             )),
//                         SizedBox(
//                             height: heights / 35,
//                             width: widths,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   'Players',
//                                   style: TextStyle(
//                                       color: Colors.black45,
//                                       fontSize: heights / 55),
//                                 ),
//                                 SizedBox(
//                                   width: widths / 10,
//                                 ),
//                                 Text(
//                                   'Points',
//                                   style: TextStyle(
//                                       color: Colors.black45,
//                                       fontSize: heights / 55),
//                                 ),
//                                 Text(
//                                   'Credits',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: heights / 55,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             )),
//                         const Divider(
//                           color: Colors.grey,
//                         ),
//                         ListView.builder(
//                           itemCount: bowlerData.length,
//                           physics: const BouncingScrollPhysics(),
//                           // scrollDirection: Axis.vertical,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             var foundBowler = selectedPlayers.indexWhere((element) =>
//                             element.id == (bowlerData[index].id));
//                             print(selectedPlayers.indexWhere((element) =>
//                             element.name == 'Lockie Ferguson'));
//                             print('foundBowler');
//                             return Column(
//                               children: [
//                                 Container(
//                                   height: heights / 13,
//                                   width: widths,
//                                   decoration: const BoxDecoration(
//                                       border: Border(
//                                           //   top: BorderSide(width: 1,color: Colors.black12),
//                                           bottom: BorderSide(
//                                               width: 1,
//                                               color: Colors.black12))),
//                                   // color: Colors.blue,
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Padding(
//                                         padding:
//                                             EdgeInsets.only(left: heights / 70),
//                                         child: InkWell(
//                                           onTap: (){
//                                             Navigator.push(context,MaterialPageRoute(builder: (context)=>playerprofile( bowldata: bowlerData[index],)));
//                                           },
//                                           child: CircleAvatar(
//                                             backgroundImage: NetworkImage(
//                                                 '${bowlerData[index].image}'),
//                                             backgroundColor: Colors.white,
//                                             radius: 20,
//                                           ),
//                                         ),
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           SizedBox(
//                                               width: 70,
//                                               child: Text(
//                                                 '${bowlerData[index].name}',
//                                                 style: TextStyle(
//                                                     fontSize: heights / 70,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               )),
//                                           Text(
//                                             '${bowlerData[index].teamName}',
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: heights / 90),
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons
//                                                     .fiber_manual_record_rounded,
//                                                 size: 7,
//                                                 color: Colors.green,
//                                               ),
//                                               SizedBox(
//                                                 width: widths / 90,
//                                               ),
//                                               Text(
//                                            '${bowlerData[index].playingStatus}',
//                                                 style: TextStyle(
//                                                     color: Colors.green,
//                                                     fontSize: heights / 95,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         width: widths / 4,
//                                       ),
//                                       Text('${bowlerData[index].points}'),
//                                       SizedBox(
//                                         width: widths / 12,
//                                       ),
//                                       Text(
//                                         '${bowlerData[index].creditPoints}',
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       // SizedBox(width: widths/70,),
//                                       const VerticalDivider(
//                                         endIndent: 10,
//                                         indent: 7,
//                                         color: Colors.grey,
//                                       ),
//                                       IconButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               if (bowlerCount < 8 &&
//                                                   bowlerColor[index] ==
//                                                       false &&
//                                                   totalPlayers < 11 && cPoints<93) {
//                                                 selectedPlayers.add(PlayerListModel(
//                                                   id: bowlerData[index].id,
//                                                   pid: bowlerData[index].pid,
//                                                   name: bowlerData[index].name,
//                                                   designationId: bowlerData[index]
//                                                       .designationId,
//                                                   teamId:
//                                                       bowlerData[index].teamId,
//                                                   playingStatus: bowlerData[index]
//                                                       .playingStatus,
//                                                   creditPoints: bowlerData[index]
//                                                       .creditPoints,
//                                                   points:
//                                                       bowlerData[index].points,
//                                                   image: bowlerData[index].image,
//                                                   dob: bowlerData[index].dob,
//                                                   nationality: bowlerData[index]
//                                                       .nationality,
//                                                   bowls: bowlerData[index]
//                                                       .bowls
//                                                       .toString(),
//                                                   bats: bowlerData[index]
//                                                       .bats
//                                                       .toString(),
//                                                   teamName: bowlerData[index]
//                                                       .teamName
//                                                       .toString(),
//                                                   createdDate: bowlerData[index]
//                                                       .createdDate,
//                                                   modifiedDate: bowlerData[index]
//                                                       .modifiedDate,
//                                                 ));
//                                                 bowlerColor[index] =
//                                                     !bowlerColor[index];
//                                                 bowlerCount =
//                                                     bowlerCount + 1;
//                                                 totalPlayers =
//                                                     totalPlayers + 1;
//                                                 selectedBowler.add(
//                                                     bowlerData[index].toString());
//                                               } else if (bowlerColor[index] ==
//                                                   true) {
//                                                 bowlerColor[index] =
//                                                     !bowlerColor[index];
//                                                 bowlerCount =
//                                                     bowlerCount - 1;
//                                                 totalPlayers =
//                                                     totalPlayers - 1;
//                                                 selectedPlayers.removeWhere(
//                                                     (item) =>
//                                                         item.id ==
//                                                         (bowlerData[index].id));
//                                               }
//                                             });
//                                             credit();
//                                           },
//                                           icon: Icon(
//                                               (bowlerColor[index])
//                                               // selectedPlayers.indexWhere((item) => item.id== (bowlerData[index].id)
//                                               // (foundBowler)
//                                                   ? Icons.remove
//                                                   : Icons.add,
//                                               color: foundBowler!=null
//                                                   ? Colors.red
//                                                   : Colors.green)),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//             ]))
//       ]),
//
//       bottomNavigationBar: SizedBox(
//         height: heights / 15,
//         // color: Colors.green,
//         child: Padding(
//           padding:
//               EdgeInsets.fromLTRB(widths / 12, 0, widths / 12, heights / 60),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               InkWell(
//                 onTap: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => Team_preview(
//                             team: selectedPlayers,
//                             match: widget.match,
//                           )));
//                 },
//                 child: Container(
//                   // height: heights/5,
//                   width: widths / 2.7,
//                   decoration: BoxDecoration(
//                       // color: Colors.blue,
//                       border: Border.all(color: Colors.red, width: 2),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: const Center(
//                       child: Text(
//                     'Preview',
//                     style: TextStyle(color: Colors.red),
//                   )),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   if (totalPlayers != 11) {
//                     showToast('Please Select 11 Players');
//                   } else if (selectedWk.isEmpty) {
//                     showToast('At-least 1 Wicketkeeper should be selected');
//                   } else if (selectedBowler.isEmpty) {
//                     showToast('At-least 1 Bowler should be selected');
//                   } else if (selectedBatsmen.isEmpty) {
//                     showToast('At-least 1 Batsman should be selected');
//                   } else if (selectedAllRounder.isEmpty) {
//                     showToast('At-least 1 Allrounder should be selected');
//                   } else {
//                     // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Save_team(batsmen: _batsmen_selected,bowlers: _bowler_selected,
//                     //     allrounders: _allrounder_selected,wicketkeeper: _wk_selected,match:widget.match)));
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => SaveTeam(
//                             team: selectedPlayers, match: widget.match)));
//                   }
//                 },
//                 child: Container(
//                   // height: heights/5,
//                   width: widths / 2.7,
//                   decoration: BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: const Center(
//                       child: Text(
//                     'Continue',
//                     style: TextStyle(color: Colors.white),
//                   )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   int cPoints = 0;
//   credit() {
//     setState(() {
//       cPoints = 0;
//     });
//     for (int i = 0; i < selectedPlayers.length; i++) {
//       int points = int.parse('${selectedPlayers[i].creditPoints}');
//       setState(() {
//         cPoints = points + cPoints;
//       });
//     }
//   }
//
//
//
//   List<PlayerListModel> selectedPlayers = [];
//   List<PlayerListModel> wicketKeeperData = [];
//   List<PlayerListModel> batsmenData = [];
//   List<PlayerListModel> allRounderData = [];
//   List<PlayerListModel> bowlerData = [];
//
//
//   bool isLoading = false;
//   // getTeamsPlayersList() async {
//   //   setState(() {
//   //     isLoading = true;
//   //   });
//   //   final response = await http.post(Uri.parse(ApiUrl.playerLists),
//   //       headers: <String, String>{
//   //         'content-Type': 'application/json; charset=UTF-8',
//   //       },
//   //       body: jsonEncode(<String, String>{
//   //         "team1id": '${widget.match.teamId1}',
//   //         "team2id": '${widget.match.teamId2}',
//   //         // "status":"Live",
//   //       }));
//   //   if (response.statusCode == 200) {
//   //     setState(() {
//   //       isLoading = false;
//   //     });
//   //     List jsonData = json.decode(response.body)['data'];
//   //     print(jsonData);
//   //
//   //     for (var json in jsonData) {
//   //       if (json["designationid"] == '4') {
//   //         wicketKeeperData.add(PlayerListModel(
//   //           id: json["id"],
//   //           pid: json["pid"],
//   //           name: json["name"],
//   //           designationid: json["designationid"],
//   //           teamid: json["teamid"],
//   //           playingStatus: json["playing_status"],
//   //           creditPoints: json["credit_points"],
//   //           points: json["points"],
//   //           image: json["image"],
//   //           dob: DateTime.parse(json["dob"]),
//   //           nationality: json["nationality"],
//   //           bowls: json["bowls"].toString(),
//   //           bats: json["bats"].toString(),
//   //           t_name: json["t_name"].toString(),
//   //           createdDate: DateTime.parse(json["created_date"]),
//   //           modifiedDate: DateTime.parse(json["modified_date"]),
//   //         ));
//   //       } else if (json["designationid"] == '3') {
//   //         allRounderData.add(PlayerListModel(
//   //           id: json["id"],
//   //           pid: json["pid"],
//   //           name: json["name"],
//   //           designationid: json["designationid"],
//   //           teamid: json["teamid"],
//   //           playingStatus: json["playing_status"],
//   //           creditPoints: json["credit_points"],
//   //           points: json["points"],
//   //           image: json["image"],
//   //           dob: DateTime.parse(json["dob"]),
//   //           nationality: json["nationality"],
//   //           bowls: json["bowls"].toString(),
//   //           bats: json["bats"].toString(),
//   //           t_name: json["t_name"].toString(),
//   //           createdDate: DateTime.parse(json["created_date"]),
//   //           modifiedDate: DateTime.parse(json["modified_date"]),
//   //         ));
//   //       } else if (json["designationid"] == '2') {
//   //         bowlerData.add(PlayerListModel(
//   //           id: json["id"],
//   //           pid: json["pid"],
//   //           name: json["name"],
//   //           designationid: json["designationid"],
//   //           teamid: json["teamid"],
//   //           playingStatus: json["playing_status"],
//   //           creditPoints: json["credit_points"],
//   //           points: json["points"],
//   //           image: json["image"],
//   //           dob: DateTime.parse(json["dob"]),
//   //           nationality: json["nationality"],
//   //           bowls: json["bowls"].toString(),
//   //           bats: json["bats"].toString(),
//   //           t_name: json["t_name"].toString(),
//   //           createdDate: DateTime.parse(json["created_date"]),
//   //           modifiedDate: DateTime.parse(json["modified_date"]),
//   //         ));
//   //       } else {
//   //         batsmenData.add(PlayerListModel(
//   //           id: json["id"],
//   //           pid: json["pid"],
//   //           name: json["name"],
//   //           designationid: json["designationid"],
//   //           teamid: json["teamid"],
//   //           playingStatus: json["playing_status"],
//   //           creditPoints: json["credit_points"],
//   //           points: json["points"],
//   //           image: json["image"],
//   //           dob: DateTime.parse(json["dob"]),
//   //           nationality: json["nationality"],
//   //           bowls: json["bowls"].toString(),
//   //           bats: json["bats"].toString(),
//   //           t_name: json["t_name"].toString(),
//   //           createdDate: DateTime.parse(json["created_date"]),
//   //           modifiedDate: DateTime.parse(json["modified_date"]),
//   //         ));
//   //       }
//   //     }
//   //   } else {
//   //     setState(() {
//   //       isLoading = false;
//   //     });
//   //     // throw Exception('Failed to load data');
//   //   }
//   // }
//   Future<void> getTeamsPlayersList() async {
//     try {
//       final response = await http.post(Uri.parse(ApiUrl.playerLists),
//           headers: <String, String>{
//             'content-Type': 'application/json; charset=UTF-8',
//           },
//           body: jsonEncode(<String, String>{
//             "team1id": '${widget.match.teamId1}',
//             "team2id": '${widget.match.teamId2}'
//           }));
//
//       if (response.statusCode == 200) {
//         List jsonData = json.decode(response.body)['data'];
//         for (var json in jsonData) {
//           PlayerListModel player = PlayerListModel.fromJson(json);
//           if (player.designationId == '4') {
//             wicketKeeperData.add(player);
//           } else if (player.designationId == '3') {
//             allRounderData.add(player);
//           } else if (player.designationId == '2') {
//             bowlerData.add(player);
//           } else {
//             batsmenData.add(player);
//           }
//         }
//       } else {
//         if (kDebugMode) {
//           print('Failed to load data');
//         }
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error fetching data: $e');
//       }
//     } finally {
//       setState(() {
//         isLoading =
//         false; // Update loading state regardless of success or failure
//       });
//     }
//     if(widget.saveTeamModel!.playerInfo!.isEmpty){
// }else{
//       setState(() {
//         wkCount = widget.saveTeamModel!.wicketKeeper!;
//         bowlerCount = widget.saveTeamModel!.bowler!;
//         batsmenCount = widget.saveTeamModel!.batsman!;
//         allRounderCount = widget.saveTeamModel!.allRounder!;
//         totalPlayers = 11;
//       });
//
//
//       for(var viewplayer in widget.saveTeamModel!.playerInfo!) {
//         selectedPlayers.add(PlayerListModel(
//           id: viewplayer.id,
//           pid: viewplayer.pid,
//           name: viewplayer.name,
//           designationId:
//           viewplayer
//               .designationId,
//           teamId:
//           viewplayer
//               .teamId,
//           playingStatus:
//           viewplayer
//               .playingStatus,
//           creditPoints:
//           viewplayer
//               .creditPoints,
//           points:
//           viewplayer
//               .points,
//           image: viewplayer
//               .image,
//           dob: viewplayer.dob.toString(),
//           nationality:
//           viewplayer
//               .nationality,
//           bowls: viewplayer
//               .bowls
//               .toString(),
//           bats: viewplayer
//               .bats
//               .toString(),
//           teamName:
//           viewplayer.teamShortName,
//           createdDate:
//           viewplayer
//               .createdDate,
//           modifiedDate:
//           viewplayer
//               .modifiedDate,
//         ));
//
//         // setState(() {
//         //
//         //
//         // if(viewplayer.designationId.toString()=='1') {
//         //   selectedBatsmen.add(
//         //       viewplayer.id.toString());
//         // }else if(viewplayer.designationId.toString()=='2'){
//         //   selectedBowler.add(
//         //       viewplayer.id.toString());
//         // }else if(viewplayer.designationId.toString()=='3'){
//         //   selectedAllRounder.add(
//         //       viewplayer.id.toString());
//         // }else{
//         //   selectedWk.add(
//         //       viewplayer.id.toString());
//         // }
//         // });
//         credit();
//         print(selectedPlayers.length);
//         print('selectedPlayers');
//       }
//       }
//
//   }
// }
//
