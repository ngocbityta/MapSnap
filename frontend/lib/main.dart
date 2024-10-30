import 'package:flutter/material.dart';
import 'package:mapsnap_fe/Screen/AccountScreen.dart';
import 'package:mapsnap_fe/Camera/mainScreenCamera.dart';
import 'package:mapsnap_fe/Screen/settingScreen.dart';
import 'package:mapsnap_fe/Screen/helpScreen.dart';
import 'package:mapsnap_fe/Screen/generalSettings.dart';
import 'package:mapsnap_fe/Widget/locator.dart';
import 'package:mapsnap_fe/Widget/accountModel.dart';
import 'package:provider/provider.dart'; // Import file model
import 'package:mapsnap_fe/Authentication/Onboarding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    // Cấp quyền truy cập cao nhất cho AccountModel
    ChangeNotifierProvider(
      create: (context) => AccountModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      //   // brightness: Brightness.light,
      //   // colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      //   useMaterial3: true,
      // ),
      home: SafeArea(
        child: Scaffold(
          body: Container(
            child: Onboarding(),
            // child: generalSettings(),
            // child: helpScreen(),
            // child: MainScreenCamera(),
            // child: accountScreen(),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

