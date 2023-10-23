import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:dream11_pw/Api/CommonApi.dart';
class HOWTO_PLAY extends StatefulWidget {
  const HOWTO_PLAY({Key? key}) : super(key: key);

  @override
  State<HOWTO_PLAY> createState() => _HOWTO_PLAYState();
}

class _HOWTO_PLAYState extends State<HOWTO_PLAY> {

  @override
  void initState() {
    Commanapi.HOWTOPLAY();
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
            title: Text('HOW TO PLAY'),
          ),
          body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: HtmlWidget(H_t_P.toString())),
        )
    );
  }
}
