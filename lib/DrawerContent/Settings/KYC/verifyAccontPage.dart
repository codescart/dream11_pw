import 'package:flutter/material.dart';


import 'verifyPancardPage.dart';
import 'verifybank_details.dart';
class VerifyAccountPage extends StatefulWidget {
  const VerifyAccountPage({super.key});

  @override
  State<VerifyAccountPage> createState() => _VerifyAccountPageState();
}

class _VerifyAccountPageState extends State<VerifyAccountPage> {
  @override
  Widget build(BuildContext context) {
    final heights=MediaQuery.of(context).size.height;
    final widths=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: InkWell(
            onTap: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back)),
        title: Text('Verify Account'),
        actions: [
          InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PANCardPage()));},
              child: Icon(Icons.add,size: heights/30,)),
          SizedBox(width: widths/20,)
        ],
        
      ),
      body: ListView(
        children: [

          Card(
            elevation: 0,
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>bankdetailspage()));

              },
              leading: Icon(Icons.account_balance_outlined,color:Colors.red,size: heights/25,),
              title: Text('Bank Account'),
              subtitle: Text('*******5927'),
              trailing: Text('Verified ✔',style: TextStyle(color: Colors.green),),

            ),
          ),
          Card(
            elevation: 0,
            child: ListTile(
              leading: Icon(Icons.panorama_outlined,color:Colors.red,size: heights/25,),
              title: Text('PAN Card'),
              subtitle: Text('CUP****89K'),
              trailing: Text('Verified ✔',style: TextStyle(color: Colors.green),),
            ),
          ),

          Card(
            elevation: 0,
            child: ListTile(
              leading: Icon(Icons.credit_card,color:Colors.red,size: heights/25,),
              title: Text('Aadhaar Number'),
              subtitle: Text('919*****927'),
              trailing: Text('Verified ✔',style: TextStyle(color: Colors.green),),
            ),
          ),
        ],
      ),
    );
  }
}
