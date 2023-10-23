import 'package:flutter/material.dart';
import 'package:dream11_pw/Api/Api_controller/walletApi.dart';
import 'package:dotted_line/dotted_line.dart';


import 'add_cash.dart';
import 'transction_history.dart';
import 'withdrawPage.dart';
class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  void initState() {
    getwallet();
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
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text('Wallet'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         Padding(
           padding:  EdgeInsets.all(18.0),
           child: Card (
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
             elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: Colors.black12)
                ),
                // color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 20,),
                    Text('Total Balance',style: TextStyle(fontSize:heights/40,fontWeight: FontWeight.bold),),
                    Text(total_amount==null?'₹ 0.0':"₹ "+total_amount.toString(),style: TextStyle(fontSize: heights/30,fontWeight: FontWeight.bold),),
                    Container(
                      height: heights/20,
                      width: widths/2.8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: InkWell
                        (onTap: (){
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>AddCash()) );

                      },
                          child: Center(
                          child: Text('Add Cash',
                            style: TextStyle(color: Colors.white,fontSize:heights/45),))),
                    ),
                    SizedBox(height: 20,),
                    DottedLine(dashLength: 5),
                    ListTile(
                      leading: Text('DEPOSITED',style:TextStyle(fontSize: heights/60,fontWeight: FontWeight.bold)),
                      trailing: Text(credit_amount==null?'₹ 0.0':"₹ "+credit_amount.toString(),style:TextStyle(fontSize: heights/60,fontWeight: FontWeight.bold,color: Colors.red)),
                    ),
                    Divider(
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    ListTile(
                      leading: Text('WINNING',style:TextStyle(fontSize: heights/60,fontWeight: FontWeight.bold)),
                      trailing: Text(winning_amount==null?'₹ 0.0':"₹ "+winning_amount.toString(),style:TextStyle(fontSize: heights/60,fontWeight: FontWeight.bold,color: Colors.red)),
                    ),
                    Divider(
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    ListTile(
                      leading: Text('BONUS',style:TextStyle(fontSize: heights/60,fontWeight: FontWeight.bold)),
                      trailing: Text(bonous_amount==null?'₹ 0.0':"₹ "+bonous_amount.toString(),style:TextStyle(fontSize: heights/60,fontWeight: FontWeight.bold,color: Colors.red)),
                    ),
                  ],
                ),
              ),
            ),
         ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Card (
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: Colors.black12)
                ),
                // color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding:EdgeInsets.only(left: heights/50),
                      child: Text('Total Withdrawl',style: TextStyle(fontSize: heights/50),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: heights/50),
                          child: Text(total_withdraw==null?'₹ 0.0':"₹ "+total_withdraw.toString(),style: TextStyle(fontSize: heights/35,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: heights/50),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>WithdrawPage()));
                            },
                            child: Container(
                              width: widths/2.3,
                              height: heights/22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.red,
                              ),
                             //
                              child: Center(child: Text('Withdraw Instantly',
                                style: TextStyle(fontSize: heights/50,color:Colors.white ),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Card (
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              elevation: 5,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>transction_history()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Colors.black12)
                  ),
                  // color: Colors.green,
                  child: Column(

                    children: [
                      SizedBox(height: 10,),
                      ListTile(title: Text('My Recent Transction',style: TextStyle(fontSize: heights/50,fontWeight: FontWeight.bold),),
                      trailing: Icon(Icons.arrow_forward_ios),),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
