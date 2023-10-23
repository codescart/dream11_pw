import 'package:flutter/material.dart';

import 'package:dream11_pw/Constant/Button/rectangleButton.dart';
import 'package:dream11_pw/generated/assets.dart';

class PANCardPage extends StatefulWidget {
  const PANCardPage({super.key});

  @override
  State<PANCardPage> createState() => _PANCardPageState();
}

class _PANCardPageState extends State<PANCardPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

  }

  @override
  void dispose(){
    super.dispose();

    _controller.dispose();
  }

  bool delivered = false;
  @override
  Widget build(BuildContext context) {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: InkWell(
            onTap: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back)),
        title: Text('KYC Verification'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: heights/0.7,
            width: widths/1.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    '*Personal Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/35),),
                ),
                Divider(thickness: 1,color: Colors.black,endIndent: 5,indent: 5,),
                Text('Enter Your Mobile Number*',style: TextStyle(fontSize: heights/60,color: Colors.grey),),
                SizedBox(
                  height: heights/15,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Mobile Number',hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Text('Enter Your Email Address*',style: TextStyle(fontSize: heights/60,color: Colors.grey),),
                SizedBox(
                  height: heights/15,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email Address',hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Text(
                    '*PAN Card Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/35),),
                ),
                Divider(thickness: 1,color: Colors.black,endIndent: 5,indent: 5,),

                Text('Enter Your FULL NAME as on PAN Card*',style: TextStyle(fontSize: heights/60,color: Colors.grey),),
                SizedBox(
                  height: heights/15,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Name',hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Text('Enter Your 10-digits PAN*',style: TextStyle(fontSize: heights/60,color: Colors.grey),),
                SizedBox(
                  height: heights/15,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'PAN',hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Text('Date of Birth*',style: TextStyle(fontSize: heights/60,color: Colors.grey),),
                SizedBox(
                  height: heights/15,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Date Of Birth',hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '*Bank Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/35),),
                ),
                Divider(thickness: 1,color: Colors.black,endIndent: 5,indent: 5,),
                Text('Account Holder Name*',style: TextStyle(fontSize: heights/60,color: Colors.grey),),
                SizedBox(
                  height: heights/15,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Holder's Name",hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Text('Your account number*',style: TextStyle(fontSize: heights/60,color: Colors.grey),),
                SizedBox(
                  height: heights/15,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Account Number',hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Text('Bank IFSC Code*',style: TextStyle(fontSize: heights/60,color: Colors.grey),),
                SizedBox(
                  height: heights/15,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'IFSC Code  Here',hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Text('Bank Name*',style: TextStyle(fontSize: heights/60,color: Colors.grey),),
                SizedBox(
                  height: heights/15,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Bank Name Here',hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: heights/20,),
                Center(child: CustomButton(onTap: (){
                  showDialog(
                      barrierColor:Colors.transparent,
                      context: context,
                      builder: (context) => AlertDialog(
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))) ,
                        backgroundColor: Colors.white,
                        content: Container(
                          height: heights /3.5,
                          width: widths / 1.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(image:AssetImage(Assets.gifAnimation),height:heights/10,width:widths/2,),
                             Text('Verified Succesfully!',style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        actions: [
                          CustomButton(onTap: (){Navigator.pop(context);}, text: 'Close')
                        ],
                      ));
                }, text: 'Verify'))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
