import 'package:flutter/material.dart';
import 'package:dream11_pw/BottomNavBar/bottom_nav_bar.dart';

import 'view_upi_apps.dart';

class AddCash extends StatefulWidget {
  const AddCash({super.key});

  @override
  State<AddCash> createState() => _AddCashState();
}

class _AddCashState extends State<AddCash> {
  TextEditingController amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BottomNavBar()));
            },
            child: const Icon(
              Icons.arrow_back,
            )),
        title: const Text('Add Cash'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wallet,
              size: heights / 10,
              color: Colors.red,
            ),
            Padding(
              padding: EdgeInsets.only(top: heights / 35),
              child: Text('Add Money to Wallet',
                  style: TextStyle(
                      fontSize: heights / 40, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.only(top: heights / 30),
              child: SizedBox(
                  height: heights / 6,
                  width: widths / 1.1,
                  child: TextField(
                    controller: amount,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: const InputDecoration(
                      hintText: 'Amount',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                  )),
            ),
            SizedBox(
                height: heights,
                child: ViewUpiApps(
                  amount: amount.text,
                )),
          ],
        ),
      ),
    );
  }
}
