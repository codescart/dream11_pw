import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dream11_pw/Api/kycApi.dart';
import 'package:dream11_pw/Constant/Button/circularbutton.dart';

import 'package:dream11_pw/Constant/Button/rectangleButton.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:dream11_pw/generated/assets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Utils/utils.dart';

class bankdetailspage extends StatefulWidget {
  const bankdetailspage({super.key});
  @override
  State<bankdetailspage> createState() => _bankdetailspageState();
}

class _bankdetailspageState extends State<bankdetailspage> with SingleTickerProviderStateMixin {




  bool loading =false;
  TextEditingController name = TextEditingController();
  TextEditingController acnumber = TextEditingController();
  TextEditingController ifsc = TextEditingController();
  TextEditingController bank = TextEditingController();


  Acdetails(){
    ifsc.text = ifsc_code == null ? '' : ifsc_code.toString();
    name.text = holders_name == null ? '' : holders_name.toString();
    acnumber.text = ifsc_code == null ? '' : Acno.toString();
    bank.text = bank_name == null ? '' : bank_name.toString();
  }

@override
  void initState() {
  Acdetails();
  Kyc.Bankdetails();
    super.initState();
  }
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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        children: [
          Center(
            child: Text(
              '*Bank Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: heights/35),),
          ),
          Divider(thickness: 1,color: Colors.black,endIndent: 5,indent: 5,),
          SizedBox(height: heights/20,),
          Text('Account Holder Name*',style: TextStyle(fontSize: heights/60,color: Colors.grey),),
          SizedBox(
            height: heights/15,
            child: TextField(
              controller: name,
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
          SizedBox(height: heights/40,),
          Text('Your account number*',style: TextStyle(fontSize: heights/60,color: Colors.grey),),
          SizedBox(
            height: heights/15,
            child: TextField(
              controller: acnumber,
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
          SizedBox(height: heights/40,),
          Text('Bank IFSC Code*',style: TextStyle(fontSize: heights/60,color: Colors.grey),),
          SizedBox(
            height: heights/15,
            child: TextField(
              controller: ifsc,
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
          SizedBox(height: heights/40,),
          Text('Bank Name*',style: TextStyle(fontSize: heights/60,color: Colors.grey),),
          SizedBox(
            height: heights/15,
            child: TextField(
              controller: bank,
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
          Center(child:
          loading==false?
          CustomButton(
              onTap: (){
                Bankdetailss(name.text,acnumber.text,ifsc.text,bank.text);

          }, text: 'Verify'):  Circularbutton(),)

        ],
      ),
    );
  }
  // final heights=MediaQuery.of(context).size.height;
  // final widths=MediaQuery.of(context).size.width;
  Bankdetailss(String name,String acnumber,String ifsc, String bank) async {
    setState(() {
      loading=true;
    });
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");

      final response = await http.post(Uri.parse(ApiUrl.kycVerification),
          headers: <String, String>{
            'content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "user_id":"$userid",
            "holders_name":name,
            "acc_no":acnumber,
            "ifsc_code":ifsc,
            "bank_name":bank,
          }));
      var data = jsonDecode(response.body);
      print(name);
      print(userid);
      print(acnumber);
      print(acnumber);
      print(ifsc);
      print(bank);
      print('qqqqqqqqqqqqqqqq');
      if (data["responsecode"] == "200") {
        setState(() {
          loading=false;
          Kyc.Bankdetails();
        });

        showDialog(
            barrierColor:Colors.transparent,
            context: context,
            builder: (context) => AlertDialog(
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))) ,
              backgroundColor: Colors.white,
              content: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image:AssetImage(Assets.gifAnimation),height:80,width:80,),
                    Text(data["message"],style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              actions: [
                CustomButton(onTap: (){
                  Navigator.pop(context);
                  Navigator.pop(context);
                }, text: 'Close')
              ],
            ));
       // Utils.flushsuccessErrorMessage(data["msg"], context, Colors.white);


      } else {
        setState(() {
          loading=false;
        });
        Utils.flushBarErrorMessage(data["message"], context, Colors.white);

      }
    }
}
