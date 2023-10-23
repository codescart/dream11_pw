import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:dream11_pw/Api/CommonApi.dart';
class ABOUTus extends StatefulWidget {
  const ABOUTus({Key? key}) : super(key: key);

  @override
  State<ABOUTus> createState() => _ABOUTusState();
}

class _ABOUTusState extends State<ABOUTus> {

  @override
  void initState() {
    Commanapi.about_us();
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
            title: Text('ABOUT US'),
          ),
          body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: HtmlWidget(ABOUTUSS.toString())),
        )
    );
  }
}
