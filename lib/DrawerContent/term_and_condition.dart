// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:dream11_pw/Api/CommonApi.dart';

class TermAndCondition extends StatefulWidget {
  const TermAndCondition({super.key});
  @override
  State<TermAndCondition> createState() => _TermAndConditionState();
}

class _TermAndConditionState extends State<TermAndCondition> {
  @override
  void initState() {
    Commanapi.Term();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text('TERM & CONDITION'),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: HtmlWidget(tandc.toString())),
    ));
  }
}
