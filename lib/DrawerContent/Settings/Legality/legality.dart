import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:dream11_pw/Api/CommonApi.dart';
class Lagality extends StatefulWidget {
  const Lagality({Key? key}) : super(key: key);

  @override
  State<Lagality> createState() => _LagalityState();
}

class _LagalityState extends State<Lagality> {

  @override
  void initState() {
    Commanapi.legal();
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
            title: Text('LEGALITY'),
          ),
          body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: HtmlWidget(Leagality.toString())),
        )
    );
  }
}
