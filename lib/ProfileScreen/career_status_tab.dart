import 'package:flutter/material.dart';
import 'package:dream11_pw/Api/Career_status.dart';

class CareerStatusTab extends StatefulWidget {
  const CareerStatusTab({super.key});

  @override
  State<CareerStatusTab> createState() => _CareerStatusTabState();
}

class _CareerStatusTabState extends State<CareerStatusTab> {

  @override
  void initState() {
    getCareerStatus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Center(
          child: SizedBox(
          width: widths/1.06,
          height: heights/2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:EdgeInsets.only(top: heights/30),
                  child: Text('Contest',style: TextStyle(fontSize: heights/50),),
                ),
                Container(
                  height:heights/18,
                  width: widths/1,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color:Colors.pink[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: widths/30),
                    child: Text(contest==null?'00':contest.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/45),),
                  ),
                ),
                Text('Matches',style: TextStyle(fontSize: heights/50),),
                Container(
                  height:heights/18,
                  width: widths/1,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color:Colors.pink[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: widths/30),
                    child: Text(matchs==null?'00':matchs.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/45),),
                  ),
                ),
                Text('Series',style: TextStyle(fontSize: heights/50),),
                Container(
                  height:heights/18,
                  width: widths/1,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color:Colors.pink[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: widths/30),
                    child: Text(series==null?'00':series.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/45),),
                  ),
                ),
                Text('WinRate',style: TextStyle(fontSize: heights/50),  ),
                Container(
                  height:heights/18,
                  width: widths/1,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color:Colors.pink[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: widths/30),
                    child: Text(wins==null?'00':'$wins %',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/45),),
                  ),
                ),

              ],
            ),
          ),
        )

        ],
      ),
    );
  }
}
