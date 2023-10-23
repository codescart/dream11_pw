import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dream11_pw/Api/Api_controller/walletApi.dart';
import 'package:dream11_pw/Api/Career_status.dart';
import 'package:dream11_pw/Api/CommonApi.dart';
import 'package:dream11_pw/Api/kycApi.dart';
import 'Provider/create_team_provider.dart';
import 'Provider/profile_update_provider.dart';
import 'Provider/view_profile_provider.dart';
import 'SplashScreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp( const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    Commanapi.Term();
    Commanapi.PPolicy();
    Commanapi.about_us();
    Commanapi.legal();
    Commanapi.Withdrawlcpolicy();
    Commanapi.refund();
    Commanapi.HOWTOPLAY();
    Kyc.Bankdetails();
    getwallet();
    getCareerStatus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context) => PlayerListProvider()),
         ChangeNotifierProvider(create: (context) => ProfileViewProvider()),
         ChangeNotifierProvider(create: (context) => UpdateUserProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dream11.PW',
        home:SplashScreen(),
      ),
    );
  }
}
