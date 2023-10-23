import 'package:flutter/material.dart';
class InvitationPage extends StatefulWidget {
  const InvitationPage({super.key});

  @override
  State<InvitationPage> createState() => _InvitationPageState();
}

class _InvitationPageState extends State<InvitationPage> {

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
        title: Text('Invitation Code'),
      ),
      body: Container(
        height: heights/3.5,
        width: widths,
        // color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text('If You Have a contest invite Code,Enter it and join.',style: TextStyle(fontSize: heights/50),),
          SizedBox(
              height: heights/15,
              width:widths/1.1,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Invite Code',hintStyle: TextStyle(color: Colors.black,fontSize: heights/40),
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

              )
          ),
          Container(
            height: heights/15,
            width: widths/1.1,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(child: Text('Join Contest',style: TextStyle(color: Colors.white,fontSize: heights/40),)),
          )
        ],),
      ),
    );
  }
}
