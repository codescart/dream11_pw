import 'package:flutter/material.dart';

import '../Constant/images.dart';
class WinnerPage extends StatefulWidget {
  const WinnerPage({super.key});

  @override
  State<WinnerPage> createState() => _WinnerPageState();
}

class _WinnerPageState extends State<WinnerPage> {

  @override
  Widget build(BuildContext context) {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        centerTitle: false,
        titleSpacing: widths/60,
        title:
        Text('Mega Contest Winner',
          style: TextStyle(fontSize: heights/45,color: Colors.white),),
        actions: [
          Align(
            child: Text(
              'Filter By Series',style: TextStyle(fontSize:heights/45,color: Colors.white),),
          ),
          Padding(
            padding: EdgeInsets.only(right: widths/20),
            child: Icon(Icons.filter_list,color: Colors.white,),
          )
        ],
      ),
      body: InkWell(
        // onTap: (){
        //   Navigator.push(context,
        //     MaterialPageRoute(builder: (context)=>CountryTabPage(match: null,)));},
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (BuildContext, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.9)),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade300,
                              width:widths/90,
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: heights/30,
                              child: Padding(
                                padding:EdgeInsets.only(left: heights/40,right:heights/ 40,top:5),
                                child: Row(
                                  children: [
                                    Text('ICC World Cup',style: TextStyle(fontSize: heights/50,color: Colors.grey),),
                                    Spacer(flex: 1,),
                                    Text('Tue,7 Feb',style: TextStyle(color: Colors.black,
                                        fontSize: heights/50),),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              indent: heights/40,
                              endIndent:heights/40,
                              thickness: 2,
                              color: Colors.black26,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: heights/40,right:heights/ 40),
                                    child: Row(
                                      children: [
                                        Text("New Zealand",style:TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: heights/50),),
                                        Spacer(flex: 1,),
                                        Text("India",style:TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: heights/50),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:EdgeInsets.all(heights/65),
                                    child: Row(
                                      children: [
                                        Image(image: AssetImage(countryflagnewzealandbg),
                                          height:heights/15,),
                                        Spacer(flex: 1),
                                        Text('Vs',style: TextStyle(fontSize:heights/40,
                                            color: Colors.red),),
                                        Spacer(flex: 1),
                                        Image(image: AssetImage(countryflagindiaroundbg),
                                          height:heights/15,)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: heights/50),
                                    child: Row(
                                      children: [
                                        Icon(Icons.emoji_events),
                                        SizedBox(
                                          width: widths/40,
                                        ),
                                        Text('Rs. 100',style: TextStyle(color: Colors.black,
                                            fontSize: heights/40),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: heights/4.3,
                              width: widths/1,
                              child: ListView.builder(
                                shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder: (BuildContext,int index){
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                                      child: Container(
                                        width: widths/3.2,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.red,width: 2),
                                          borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: heights/90,
                                            ),
                                            Text('Rank 1',style: TextStyle(fontSize: heights/40),),
                                            Text('Gourav',style: TextStyle(fontSize: heights/40),),
                                            CircleAvatar(
                                                radius: heights/30,
                                                backgroundImage:
                                            AssetImage(imagesFieldgrass)
                                            ),
                                            // Spacer(),
                                            Container(
                                              height:heights/20,
                                              width: widths,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(13),
                                                      bottomRight: Radius.circular(13)),
                                              ),
                                              child: Center(child: Text('Rs. 600000',
                                                style: TextStyle(color: Colors.white,
                                                    fontSize: heights/45),)),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),

          ],
        ),
      ),
    );
  }
}
