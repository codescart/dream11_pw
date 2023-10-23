
import 'package:flutter/material.dart';
import 'package:dream11_pw/Constant/images.dart';

class HomeFootBallTabBar extends StatefulWidget {
  const HomeFootBallTabBar({super.key});

  @override
  State<HomeFootBallTabBar> createState() => _HomeFootBallTabBarState();
}

class _HomeFootBallTabBarState extends State<HomeFootBallTabBar> {
  @override
  Widget build(BuildContext context) {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return Scaffold(
      body: InkWell(
      //  onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>PaytmTab())); },
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(7.9)),
                      child: Container(
                        height: heights / 4.5,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: heights / 55,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: heights / 40,
                                    right: heights / 40),
                                child: Row(
                                  children: [
                                    Text(
                                      'Paytm Trophy',
                                      style: TextStyle(
                                          fontSize: heights / 65),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    const Icon(
                                      Icons.groups,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Lineups Out',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: heights / 65),
                                    ),
                                    SizedBox(
                                      width: widths / 30,
                                    ),
                                    const Icon(
                                      Icons.notifications_none,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              indent: heights / 40,
                              endIndent: heights / 40,
                              color: Colors.black26,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: heights / 40,
                                      right: heights / 40),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Gim asia",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: heights / 65),
                                      ),
                                      const Spacer(
                                        flex: 1,
                                      ),
                                      Text(
                                        "Velez SarsField",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: heights / 65),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(heights / 65),
                                  child: Row(
                                    children: [
                                      Image(
                                        image: const AssetImage(
                                            imagesGimnasiafootballteam),
                                        height: heights / 15,
                                      ),
                                      const Spacer(flex: 1),
                                      Icon(
                                        Icons
                                            .fiber_manual_record_rounded,
                                        color: Colors.red,size: heights/50,
                                      ),
                                      Text(
                                        '05/02/2023',
                                        style: TextStyle(
                                            fontSize: heights / 60,
                                            color: Colors.red),
                                      ),
                                      const Spacer(flex: 1),
                                      Image(
                                        image: const AssetImage(
                                            imagesVelezfootballteam),
                                        height: heights / 15,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: heights / 18,
                                  width: widths / 1,
                                  decoration: const BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.only(
                                          bottomRight:
                                          Radius.circular(5),
                                          bottomLeft:
                                          Radius.circular(5))),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: heights / 45,
                                        left: heights / 45),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: heights / 30,
                                          width: widths / 5.5,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.red),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  5)),
                                          child: Center(
                                              child: Text('Mega',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize:
                                                      heights /
                                                          50))),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '₹ 100',
                                          style: TextStyle(
                                              fontSize: heights / 50,fontWeight: FontWeight.bold),
                                        ),
                                        const Spacer(
                                          flex: 1,
                                        ),
                                        Icon(
                                          Icons.tv,
                                          size: heights / 30,
                                        ),
                                        SizedBox(
                                          width: heights / 40,
                                        ),
                                        Icon(
                                          Icons.campaign,
                                          size: heights / 30,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
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
