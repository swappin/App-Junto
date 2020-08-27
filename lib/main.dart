import 'dart:convert';
import 'dart:ffi';

import 'package:appjunto/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';

import 'package:video_player/video_player.dart';

import 'CPagarModel.dart';



void main() async{

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'JuntoTelecom',
      theme: ThemeData(),
      home: Splashscreen(),

      routes: <String, WidgetBuilder>{
        "/HomeScreen": (BuildContext context) => new HomeScreen(),
        "/Profile": (BuildContext context) => new Profile(),
        "/Receber": (BuildContext context) => new Receber(),
        "/Pagar": (BuildContext context) => new Pagar(),
        "/Clientes": (BuildContext context) => new Clientes(),
      },
    );
  }
}
