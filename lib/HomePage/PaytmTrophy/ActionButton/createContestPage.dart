import 'package:flutter/material.dart';
import 'package:dream11_pw/Constant/Button/rectangleButton.dart';
import 'package:dream11_pw/generated/assets.dart';
class CreateContestPage extends StatefulWidget {
  const CreateContestPage({super.key});

  @override
  State<CreateContestPage> createState() => _CreateContestPageState();
}

class _CreateContestPageState extends State<CreateContestPage> {
  @override
  Widget build(BuildContext context) {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: ()
            {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text('Create a Contest'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: widths/1.06,
              height: heights/2.5,
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height:heights/15,
                    width: widths/1,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: widths/30),
                      child: Text('Contest Name',
                        style: TextStyle(fontSize: heights/45),),
                    ),
                  ),
                  Container(
                    height:heights/15,
                    width: widths/1,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: widths/30),
                      child: Text('Contest Size',
                        style: TextStyle(fontSize: heights/45),),
                    ),
                  ),
                  Container(
                    height:heights/15,
                    width: widths/1,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: widths/30),
                      child: Text('Entry',
                        style: TextStyle(fontSize: heights/45),),
                    ),
                  ),
                  Container(
                    height:heights/15,
                    width: widths/1,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: widths/30),
                      child: Row(
                        children: [
                          Container(
                              height:heights/25,
                              width: widths/9,
                              child: Image(image: AssetImage(Assets.imagesTeam11),)),
                          SizedBox(width:widths/15,),
                          Column(
                            children: [
                              SizedBox(height: heights/80,),
                              Text('Max Price Pool',style: TextStyle(fontSize: heights/60),),
                              Text('Rs.380',style: TextStyle(fontSize: heights/45,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: heights/25,),
          Center(child: CustomButton(onTap: (){}, text: 'Create Contest'))
        ],
      ),
    );
  }
}
