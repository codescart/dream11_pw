import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:dream11_pw/Api/CommonApi.dart';
class refund_POLICY extends StatefulWidget {
  const refund_POLICY({Key? key}) : super(key: key);

  @override
  State<refund_POLICY> createState() => _refund_POLICYState();
}

class _refund_POLICYState extends State<refund_POLICY> {

  @override
  void initState() {
    Commanapi.refund();
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
            title: Text('REFUND POLICY'),
          ),
          body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: HtmlWidget(refund_p.toString())),
        )
    );
  }
}
