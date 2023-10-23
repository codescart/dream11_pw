import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dream11_pw/Api/Api_controller/transctionhistory_controller.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:http/http.dart' as http;

class transction_history extends StatefulWidget {
  @override
  State<transction_history> createState() => _transction_historyState();
}

class _transction_historyState extends State<transction_history> {
  // bool _loading;
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        title: const Text('Transction History'),
      ),
      body: FutureBuilder<List<Tranx_controller>>(
          future: que(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No Transction History",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height: heights / 7,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: heights / 35,
                                    right: heights / 30,
                                    top: heights / 40),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(
                                      child: Text(
                                          '₹ ${snapshot.data![index].amount}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w900,
                                              fontSize: heights / 30)),
                                    ),
                                    Center(
                                      child: Text(
                                          '${snapshot.data![index].type}'
                                              .toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: heights / 40)),
                                    ),
                                  ],
                                ),
                              ),
                              Text('${snapshot.data![index].createdDate}',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: heights / 70)),
                              Container(
                                height: heights / 20,
                                width: widths / 1,
                                decoration: const BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15))),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: heights / 45, left: heights / 45),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.info_outline,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                          '${snapshot.data![index].transectionMode}',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: heights / 70)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }

  Future<List<Tranx_controller>> que() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    final response = await http.post(Uri.parse(ApiUrl.myAccountTransaction),
        headers: <String, String>{
          'content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"user_id": '$userid'}));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'] as List<dynamic>;

      return jsonData.map((item) => Tranx_controller.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
