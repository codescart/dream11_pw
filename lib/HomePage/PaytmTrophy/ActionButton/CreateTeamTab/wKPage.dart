// import 'package:flutter/material.dart';
// import 'package:dream11_pw/HomePage/PaytmTrophy/ActionButton/CreateTeamTab/up_c_create_team_tab_bar.dart';
// import 'package:dream11_pw/Model/player_list_model.dart';
// import 'package:dream11_pw/generated/assets.dart';
//
//
// class WKPage extends StatefulWidget {
//   List<PlayerListModel> selectedPlayers;
//   List<PlayerListModel> allPlayers;
//   final String type;
//    WKPage({super.key,required this.selectedPlayers ,required this.allPlayers, required this.type  });
//
//   @override
//   State<WKPage> createState() => _WKPageState();
// }
//
// class _WKPageState extends State<WKPage> {
//
// int cPoint=0;
//
//
//   bool  swetapagal = true;
//   @override
//   Widget build(BuildContext context) {
//     final heights=MediaQuery.of(context).size.height;
//     final widths=MediaQuery.of(context).size.width;
//     return ListView(
//       children: [
//         Container(
//           height: heights/20,
//           width: widths,
//           color: Colors.grey[200],
//           child: Center(child: Text('Pick 1-8 Wicket Keeper',
//             style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/55),)),
//         ),
//         Container(
//           height: heights/25,
//           width: widths,
//           // color: Colors.blue,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text('Players',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
//               SizedBox(width: widths/15,),
//               Text('Points',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
//               // SizedBox(width:2,),
//               Text('Credits',style: TextStyle(fontWeight: FontWeight.bold),)
//             ],
//           ),
//         ),
//         for(var data in widget.allPlayers)
//           if(data.designationId == widget.type)
//             Container(
//               height: heights/13,
//               width: widths,
//               decoration: BoxDecoration(
//                   border: Border(
//                       top: BorderSide(width: 1,color: Colors.black12),
//                       bottom: BorderSide(width: 1,color: Colors.black12)
//                   )
//               ),
//               // color: Colors.blue,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding:EdgeInsets.only(left: heights/70),
//                     child: CircleAvatar(backgroundImage: NetworkImage('${data.image}'),
//                       backgroundColor: Colors.white,
//                       radius: 20,),
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('${data.name}',style: TextStyle(fontSize: heights/70,fontWeight: FontWeight.bold),),
//                       Text(widget.type=='1'?'Batsman':widget.type=='2'?'Bowler':widget.type=='3'?'All Rounder':'Wicket Keeper',style: TextStyle(color: Colors.grey,fontSize: heights/90),),
//                       Row(
//                         children: [
//                           Icon(Icons.fiber_manual_record_rounded,size: 7,color: Colors.green,),
//                           SizedBox(width: widths/90,),
//                           Text('Playing',style: TextStyle(color: Colors.green,fontSize: heights/95,fontWeight: FontWeight.bold),),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(width:widths/4,),
//                   Text('0.0'),
//                   SizedBox(width: widths/12,),
//                   Text('${data.creditPoints}',style: TextStyle(fontWeight: FontWeight.bold),),
//                   // SizedBox(width: widths/70,),
//                   VerticalDivider(
//                     endIndent:10,
//                     indent: 7,
//                     color: Colors.grey,
//                   ),
//                   IconButton(onPressed:(){
//                     var result = selectedPlayers.where((food) => food.pid!.toLowerCase().contains(data.pid!.toLowerCase())).toList();
//                         if(total <11 && cPoints<93 && result.length<=0 ) {
//                       selectedPlayers.add(PlayerListModel(
//                         id: data.id,
//                         pid: data.pid,
//                         name: data.name,
//                         designationId: data.designationId,
//                         teamId: data.teamId,
//                         playingStatus: data.playingStatus,
//                         creditPoints: data.creditPoints,
//                         points: data.points,
//                         image: data.image,
//                         dob: data.dob,
//                         nationality: data.nationality,
//                         bowls: data.bowls.toString(),
//                         bats: data.bats.toString(),
//                         teamName: data.teamName.toString(),
//                         createdDate: data.createdDate,
//                         modifiedDate: data.modifiedDate,
//                       ));
//                       setState(() {
//                         total=total+1;
//                       });
//                     }else{
//                       selectedPlayers.removeWhere(
//                               (item) =>
//                           item.pid ==
//                               (data.pid));
//                       setState(() {
//                         total=total-1;
//                       });
//                     }
//
//                     credit();
//                   },
//
//                       icon:Icon(
//                         selectedPlayers.where((food) => food.pid!.toLowerCase().contains(data.pid!.toLowerCase())).toList().length<=0?
//                         Icons.add:Icons.remove,color:
//                       selectedPlayers.where((food) => food.pid!.toLowerCase().contains(data.pid!.toLowerCase())).toList().length<=0?
//                       Colors.green:Colors.red,)),                      ],
//               ),
//             ),
//
//         SizedBox(height: MediaQuery.of(context).size.height*0.08,)
//       ],
//     );
//   }
// }
