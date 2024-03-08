import 'package:flutter/material.dart';
import 'package:poker_hand_guru/screens/welcome_screen.dart';

class PokerGuru extends StatelessWidget {
  const PokerGuru({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poker Hand Guru',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.green, // Set your primary color here
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Atma', // Use your desired font family
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
          headline2: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
          headline3: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
          bodyText1: TextStyle(fontSize: 16.0, color: Colors.black),
          bodyText2: TextStyle(fontSize: 14.0, color: Colors.black),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green, // Set your button color here
          textTheme: ButtonTextTheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
