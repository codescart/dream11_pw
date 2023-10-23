import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:dream11_pw/Api/CommonApi.dart';
class WITHDRAWL_CASH_POLICY extends StatefulWidget {
  const WITHDRAWL_CASH_POLICY({Key? key}) : super(key: key);

  @override
  State<WITHDRAWL_CASH_POLICY> createState() => _WITHDRAWL_CASH_POLICYState();
}

class _WITHDRAWL_CASH_POLICYState extends State<WITHDRAWL_CASH_POLICY> {

  @override
  void initState() {
    Commanapi.Withdrawlcpolicy();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.red,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
            title: Text('WITHDRAWL CASH POLICY'),
          ),
          body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: HtmlWidget(wcp.toString())),
        )
    );
  }
}
