import 'package:flutter/material.dart';
import 'package:dream11_pw/generated/assets.dart';
class BatPage extends StatefulWidget {
  const BatPage({super.key});

  @override
  State<BatPage> createState() => _BatPageState();
}

class _BatPageState extends State<BatPage> {
  bool  swetapagal = true;
  @override
  Widget build(BuildContext context) {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: heights/20,
            width: widths,
            color: Colors.grey[200],
            child: Center(child: Text('Pick 1-2 Wicket Keeper',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/55),)),
          ),
          Container(
            height: heights/25,
            width: widths,
            // color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Players',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                SizedBox(width: widths/15,),
                Text('Points',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                // SizedBox(width:2,),
                Text('Credits',style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (BuildContext, int index) {
                return Container(
                  height: heights/13,
                  width: widths,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1,color: Colors.black12),
                          bottom: BorderSide(width: 1,color: Colors.black12)
                      )
                  ),
                  // color: Colors.blue,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:EdgeInsets.only(left: heights/70),
                        child: CircleAvatar(backgroundImage: AssetImage(Assets.imagesMsantnerbg),
                          backgroundColor: Colors.white,
                          radius: 20,),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Virat Kohli',style: TextStyle(fontSize: heights/55,fontWeight: FontWeight.bold),),
                          Text('IND-WK',style: TextStyle(color: Colors.grey,fontSize: heights/90),),
                          Row(
                            children: [
                              Icon(Icons.fiber_manual_record_rounded,size: 7,color: Colors.green,),
                              SizedBox(width: widths/90,),
                              Text('Playing',style: TextStyle(color: Colors.green,fontSize: heights/95,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width:widths/4,),
                      Text('0.0'),
                      SizedBox(width: widths/12,),
                      Text('12',style: TextStyle(fontWeight: FontWeight.bold),),
                      // SizedBox(width: widths/70,),
                      VerticalDivider(
                        endIndent:10,
                        indent: 7,
                        color: Colors.grey,
                      ),
                      IconButton(onPressed:(){
                        setState(() {
                          swetapagal=!swetapagal;
                        });

                      },

                          icon:Icon(
                            swetapagal?
                            Icons.add:Icons.remove,color:
                          swetapagal?
                          Colors.green:Colors.red,)),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
