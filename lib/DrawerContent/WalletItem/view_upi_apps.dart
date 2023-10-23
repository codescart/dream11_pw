// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dream11_pw/Constant/api_url.dart';
import 'package:upi_india/upi_india.dart';
import 'package:http/http.dart' as http;
import '../../../Utils/utils.dart';

class ViewUpiApps extends StatefulWidget {
  final String amount;
  const ViewUpiApps({super.key, required this.amount});
  @override
  _ViewUpiAppsState createState() => _ViewUpiAppsState();
}

class _ViewUpiAppsState extends State<ViewUpiApps> {
  Future<UpiResponse>? _transaction;
  UpiIndia upiIndia = UpiIndia();
  List<UpiApp>? apps;

  TextStyle header = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);

  TextStyle value = const TextStyle(
      fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black);

  @override
  void initState() {
    upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    var long2 = double.parse(widget.amount.toString());
    return upiIndia.startTransaction(
      app: app,
      receiverUpiId: "merchant969855.augp@aubank",
      receiverName: '100X Bet',
      transactionRefId: 'Razorpay0256',
      transactionNote: '100x',
      amount: long2,
    );
  }

  Widget displayUpiApps() {
    if (apps == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (apps!.isEmpty) {
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    } else {
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: app.name == 'PhonePe'
                    ? () {}
                    : () {
                        _transaction = initiateTransaction(app);
                        setState(() {});
                      },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      app.name == 'PhonePe'
                          ? Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  color: Colors.black.withOpacity(0.1)),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.lock_outline_rounded),
                              ),
                            )
                          : Image.memory(
                              app.icon,
                              height: 60,
                              width: 60,
                            ),
                      app.name == 'PhonePe'
                          ? Text(
                              app.name,
                              style: const TextStyle(color: Colors.grey),
                            )
                          : Text(app.name),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'Please Enter Amount';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        addMoney();
        if (kDebugMode) {
          print('Transaction Successful');
        }
        break;
      case UpiPaymentStatus.SUBMITTED:
        if (kDebugMode) {
          print('Transaction Submitted');
        }
        break;
      case UpiPaymentStatus.FAILURE:
        if (kDebugMode) {
          print('Transaction Failed');
        }
        break;
      default:
        if (kDebugMode) {
          print('Received an Unknown transaction status');
        }
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
            body,
            style: value,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return ListView(
      shrinkWrap: true,
      children: [
        const Center(
            child: Text(
          "PAY USING",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w900),
        )),
        const SizedBox(
          height: 20,
        ),
        displayUpiApps(),
        FutureBuilder(
          future: _transaction,
          builder: (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    _upiErrorHandler(snapshot.error.runtimeType),
                    style: header,
                  ), // Print's text message on screen
                );
              }

              // If we have data then definitely we will have UpiResponse.
              // It cannot be null
              UpiResponse upiResponse = snapshot.data!;

              // Data in UpiResponse can be null. Check before printing
              String txnId = upiResponse.transactionId ?? 'N/A';
              String resCode = upiResponse.responseCode ?? 'N/A';
              String txnRef = upiResponse.transactionRefId ?? 'N/A';
              String status = upiResponse.status ?? 'N/A';
              String approvalRef = upiResponse.approvalRefNo ?? 'N/A';
              _checkTxnStatus(status);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    displayTransactionData(
                      'Transaction Id',
                      txnId,
                    ),
                    displayTransactionData('Response Code', resCode),
                    displayTransactionData('Reference Id', txnRef),
                    displayTransactionData('Status', status.toUpperCase()),
                    displayTransactionData('Approval No', approvalRef),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text(''),
              );
            }
          },
        )
      ],
    );
  }

  addMoney() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    final response = await http.post(
      Uri.parse(ApiUrl.addCash),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(<String, String>{
        "user_id": '$userid',
        "amount": widget.amount,
        "transection_via": "upi",
        "mode": "upi"
      }),
    );
    var data = jsonDecode(response.body);
    if (data["responsecode"] == '200') {
      Utils.RechargePopUp(context);
    } else {
      Utils.flushBarErrorMessage(data["message"], context, Colors.white);
    }
  }
}
